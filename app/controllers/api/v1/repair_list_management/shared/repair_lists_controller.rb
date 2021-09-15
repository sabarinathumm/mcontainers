class Api::V1::RepairListManagement::Shared::RepairListsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @repair_lists = RepairList.all
        render json: @repair_lists, each_serializer: RepairListSerializer
    end

    def create
        
        ActiveRecord::Base.transaction do
            RepairList.update(is_active: false)
            @repair_list = RepairList.create!(name: 'Version '+((RepairList.count+1).to_s), \
                is_active: true)
        end
        
        if @repair_list.save
            render json: @repair_list, serializer: RepairListSerializer
        else
            render json: { error: 'Could not create new Repair List'}, status: :unprocessable_entity
        end
    end

end