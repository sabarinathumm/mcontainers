class Api::V1::ContainerManagement::Shared::ContainersController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_container, only: [:show, :update, :download]

    def index
        @containers = Container.all
        render json:  @containers, each_serializer: ContainerSerializer
    end

    def create
        @container = Container.new(container_params)
        if @container.save!
            render json: @container, serializer: ContainerSerializer
        else
            throw_error('Container could not be created', status: :unprocessable_entity)
        end
    end

    def show
        render json: { container: ContainerSerializer.new(@container).as_json, navigation: {total_count: Container.all.count, \
            next_id: @container.next_id, previous_id: @container.prev_id}, position: @container.position}
    end

    def update
        
        if @container.update!(container_params)
            render json: @container, serializer: ContainerSerializer
        else
            throw_error('Container could not be updated', status: :unprocessable_entity)
        end
    end

    def download
        @container_attachments = @container.container_attachments
        @container_attachments.each do |ca|
            new_file = File.join('public', ca.attachment_url)
            send_file new_file, :disposition => 'attachment' if File.exists?(new_file)
        end
    end

    private

    def set_container
        @container = Container.find(params[:id])
    end

    def container_params
        params.require(:container).permit(:yard_id, :container_uid, :customer_id, :container_owner_name, :submitter_initials, \
            :container_length, :container_width, :container_type_id, :manufacture_year, :location, :comments, \
            container_attachments: [:attachment_type, :attachment])

    end

end