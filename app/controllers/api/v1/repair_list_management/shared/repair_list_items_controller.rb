class Api::V1::RepairListManagement::Shared::RepairListItemsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_repair_list, only: [:index, :create, :export]
    before_action :filter_items, only: [:index]
    before_action :set_format, only: [:export]
    before_action :validate_upload, only: [:upload]

    def index
        @repair_list_items = @repair_list_items.where("lower(uid) LIKE ?", params[:search_text].downcase) unless params[:search_text].blank?
        @repair_list_items = paginate @repair_list_items.page(params[:page])
        
        render json: @repair_list_items, each_serializer: RepairListItemSerializer, meta: pagination_dict(@repair_list_items)
    end

    # def get_next_uid
    #     old_id = RepairListItem.where(repair_list: @repair_list).order(uid: :desc).first.uid.last(4).to_i + 1
    #     next_uid = 'RID'+old_id.to_s.last(4)
    #     render json: { uid: next_uid }, status: :ok
    # end

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
            RepairListItem.import(@repair_list_item_upload, params[:repair_list_id])
            render json: { success: 'Upload is completed' }, status: :created
        rescue Exception => e
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
        @repair_list_item_upload = RepairListItemUpload.create!(attachment: upload_params[:attachment])

        #repair_list_item_upload = RepairListItemUpload.create!(attachment: upload_params[:attachment])
        #puts repair_list_item_upload.attachment
        if @repair_list_item_upload.attachment.file.blank?
            throw_error("Please attach a file for upload.", :unprocessable_entity)
        end

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
        params.require(:repair_list_item).permit(:container_repair_area_id, :uid, :container_damaged_area_id, :repair_type_id, \
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
    
    def sort_params
        params.permit(:container_repair_area, :container_damaged_area, :uid, :repair_type)
    end

    def filter_items
        @repair_list_items = RepairListItem.where(repair_list: @repair_list, deleted_at: nil)
        @repair_list_items = @repair_list_items.filter_by_container_repair_area_id(params[:container_repair_area_id]) unless params[:container_repair_area_id].nil? ||  @repair_list_items.nil?
        @repair_list_items = @repair_list_items.filter_by_container_damaged_area_id(params[:container_damaged_area_id]) unless params[:container_damaged_area_id].nil? ||  @repair_list_items.nil?
        @repair_list_items = @repair_list_items.filter_by_repair_type_id(params[:repair_type_id]) unless params[:repair_type_id].nil? ||  @repair_list_items.nil?

        if params[:uid].present? && params[:uid].to_i == 1
            @repair_list_items = @repair_list_items.order(uid: :asc)
        elsif params[:uid].present? && params[:uid].to_i == -1
            @repair_list_items = @repair_list_items.order(uid: :desc)
        end

        if params[:container_damaged_area].present? && params[:container_damaged_area].to_i == 1
            @repair_list_items = @repair_list_items.includes(:container_damaged_area).order('container_damaged_areas.name asc')
        elsif params[:container_damaged_area].present? && params[:container_damaged_area].to_i == -1
            @repair_list_items = @repair_list_items.includes(:container_damaged_area).order('container_damaged_areas.name desc')
        end

        if params[:container_repair_area].present? && params[:container_repair_area].to_i == 1
            @repair_list_items = @repair_list_items.includes(:container_repair_area).order('container_repair_areas.name asc')
        elsif params[:container_repair_area].present? && params[:container_repair_area].to_i == -1
            @repair_list_items = @repair_list_items.includes(:container_repair_area).order('container_repair_areas.name desc')
        end

        if params[:repair_type].present? && params[:repair_type].to_i == 1
            @repair_list_items = @repair_list_items.includes(:repair_type).order('repair_types.name asc')
        elsif params[:repair_type].present? && params[:repair_type].to_i == -1
            @repair_list_items = @repair_list_items.includes(:repair_type).order('repair_types.name desc')
        end
    end

end