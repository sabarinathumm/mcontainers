class Api::V1::ContainerManagement::Shared::ContainersController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_container, only: [:show, :update, :download]

    def index
        @containers = Container.all
        render json:  @containers, each_serializer: ContainerSerializer
    end

    def validate_container
         if ValidateContainerUidJob.perform_now(validate_container_params[:container_uid])
            render json: { success: true }
         else
            render json: { success: false }
         end
    end

    def create

        ActiveRecord::Base.transaction do
            @container = Container.create!(container_params)
            @container.activities.create!(activity_status: 'idle', assigned_to: current_admin)
        end
        
        if @container.save!
            render json: @container, serializer: ContainerSerializer
        else
            throw_error('Container could not be created', status: :unprocessable_entity)
        end
    end

    def show
        render json: { container: ContainerSerializer.new(@container).as_json, navigation: {total_count: Container.all.count, \
            next_id: @container.next_id, previous_id: @container.prev_id, position: @container.position}}
    end

    def update
        
        @container.container_attachments.destroy_all if container_params[:container_attachments].present?
        
        if @container.update!(container_params)
            render json: @container, serializer: ContainerSerializer
        else
            throw_error('Container could not be updated', status: :unprocessable_entity)
        end
    end

    def download
        @container_attachments = @container.container_attachments

        folder_path = "#{Rails.root}/public/downloads/"
        zipfile_name = "#{Rails.root}/public/archive.zip"

        FileUtils.remove_dir(folder_path) if Dir.exist?(folder_path)
        FileUtils.remove_entry(zipfile_name) if File.exist?(zipfile_name)
        Dir.mkdir("#{Rails.root}/public/downloads")

        Zip::File.open(Rails.root.join(zipfile_name), Zip::File::CREATE) do |zip|
            @container_attachments.each do |ca|
              unless ca.attachment_url.nil?
                filename = "public/downloads/container_attachment_#{ca.id}_#{DateTime.now.to_i}.jpeg"
                IO.copy_stream(open(ca.attachment_url),  Rails.root.join(filename))
                zip.add( "#{@container.container_uid}-attachments/#{ca.attachment_type}_#{ca.id}.jpeg",Rails.root.join(filename))
              end
            end
        end
        
        send_file(File.join("#{Rails.root}/public/", 'archive.zip'), :type => 'application/zip', :filename => "#{Time.now.to_date}.zip")

    end

    private

    def set_container
        @container = Container.find(params[:id])
    end

    def validate_container_params
        params.permit(:container_uid)
    end

    def container_params
        params.require(:container).permit(:yard_id, :container_uid, :customer_id, :container_owner_name, :submitter_initials, \
            :container_length, :container_width, :container_type_id, :manufacture_year, :location, :comments, \
            container_attachments: [:attachment_type, :attachment_id])

    end

end