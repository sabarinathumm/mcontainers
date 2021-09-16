class Api::V1::RepairListManagement::Shared::RepairListItemsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_repair_list, only: [:index, :create, :export]
    before_action :set_format, only: [:export]
    before_action :validate_upload, only: [:upload]

    def index
        @repair_list_items = paginate RepairListItem.where(repair_list: @repair_list, deleted_at: nil)
        render json: @repair_list_items, each_serializer: RepairListItemSerializer, meta: pagination_dict(@repair_list_items)
    end

    def show
        @repair_list_item = RepairListItem.find(params[:id])
        render json: @repair_list_item, serializer: RepairListItemSerializer
    end

    def create
        create_params = repair_list_item_params.merge!(repair_list: @repair_list)
        @repair_list_item = RepairListItem.create!(create_params)
        render json: @repair_list_item, serializer: RepairListItemSerializer
    end

    def delete
        @repair_list_item = RepairListItem.find(params[:id])
        @repair_list_item.update!(deleted_at: DateTime.now)
        render json: @repair_list_item, serializer: RepairListItemSerializer
    end

    def update
        @repair_list_item = RepairListItem.find(params[:id])
        @repair_list_item.update!(repair_list_item_params)
        render json: @repair_list_item, serializer: RepairListItemSerializer
    end

    def upload
        begin
            RepairListItem.import(@repair_list_item_upload)
            render json: { success: 'Upload is completed' }, status: :created
        rescue Exception => e
            puts e.as_json
            throw_error("Upload not completed. Please try again.", :unprocessable_entity)  
        end
    end

    def export
        @repair_list_items = RepairListItem.where(repair_list: @repair_list)
        respond_to do |format|
            format.csv { send_data @repair_list_items.export, filename: "Repair_List_Items_#{@repair_list.id}_#{Date.today}.csv", \
            type: "text/csv" , disposition: 'attachment', status: :ok }
        end
    end

    def validate_upload
       
            puts params.permit(:attachment)
            puts params.attachment
            @repair_list_item_upload = RepairListItemUpload.create!(attachment: upload_params[:attachment])

        #repair_list_item_upload = RepairListItemUpload.create!(attachment: upload_params[:attachment])
        #puts repair_list_item_upload.attachment
        # if @repair_list_item_upload.attachment.file.blank?
        #     throw_error("Please attach a file for upload.", :unprocessable_entity)
        # end

        @errors = []

        # begin
        #     spreadsheet = open_spreadsheet(@repair_list_item_upload.attachment.file)
        #     header = spreadsheet.row(1)

        #     (2..spreadsheet.last_row).each do |i|
        #         to_hash = Hash[[header, spreadsheet.row(i)].transpose]

        #     end

        # end
    end

    def open_spreadsheet(attachment)
        case File.extname(attachment.original_filename)
        when ".csv" then Csv.new(attachment.path, nil, :ignore)
        when ".xls" then Excel.new(attachment.path, nil, :ignore)
        when ".xlsx" then Excelx.new(attachment.path, nil, :ignore)
        else raise "Unknown file type: #{attachment.original_filename}"
        end
    end


    private

    def set_repair_list
        @repair_list = RepairList.find(params[:repair_list_id])
    end

    def repair_list_item_params
        params.require(:repair_list_item).permit(:container_repair_area_id, :container_damaged_area_id, :repair_type_id, \
            :non_mearsk_hours, :non_mearsk_material_cost, :is_non_mearsk_not_applicable, :non_mearsk_id_source, \
            :non_mearsk_description, :comp_id, :rep_id, :dam_id, :component_id, \
            :location, :event_id, :length, :width, :unit_id, :is_mearsk_not_applicable, \
            :mearsk_unit_material_cost, :mearsk_max_material_cost, :mearsk_hours_per_unit, :mesrsk_max_pieces, \
            :mearsk_units, :repair_mode_id, :mode_number_id, :repair_code, :combined, :mearsk_description, :mearsk_id_source)
    end

    def upload_params
        params.slice(:attachment)
    end

    def set_format
        request.format = 'csv'
    end

end