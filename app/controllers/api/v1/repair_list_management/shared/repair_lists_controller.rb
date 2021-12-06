class Api::V1::RepairListManagement::Shared::RepairListsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @repair_lists = RepairList.all.order(created_at: :asc)
        render json: @repair_lists, each_serializer: RepairListSerializer
    end

    def all_customer_lists
        @repair_lists = CustomerRepairList.all.where(is_active: true).to_a
        @repair_lists << RepairList.where(is_active: true).first
        @repair_lists.last.id = 0
        #render json: @repair_lists, each_serializer: RepairListSerializer
        render json: { customer_repair_lists: ActiveModel::Serializer::CollectionSerializer.new(@repair_lists, serializer: RepairListSerializer) }
    end

    def create
        
        ActiveRecord::Base.transaction do
           
            @old_repair_list = RepairList.where(is_active: true).first
            RepairList.update(is_active: false)
            @repair_list = RepairList.create!(name: 'Version '+((RepairList.count+1).to_s), \
            is_active: true)

            @old_repair_list.repair_list_items.each do |item|
                @repair_list.repair_list_items.create!(item.attributes.except("id", "created_at", "updated_at"))
            end
           
        end
        
        if @repair_list.save
            render json: @repair_list, serializer: RepairListSerializer
        else
            render json: { error: 'Could not create new Repair List'}, status: :unprocessable_entity
        end
    end

    def version_activation
        ActiveRecord::Base.transaction do
            RepairList.update(is_active: false)
            @repair_list = RepairList.find(params[:id])
            @repair_list.update!(is_active: true)
        end
        puts "VERSION"
        puts @repair_list.to_json
        render json: @repair_list, serializer: RepairListSerializer
    end

end