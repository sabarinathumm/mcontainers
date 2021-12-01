class Api::V1::RepairListManagement::Admin::CustomerRepairListsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_customer, except: [:version_activation]

    def index
        @repair_lists = CustomerRepairList.where(customer: @customer).order(updated_at: :desc)
        render json: @repair_lists, each_serializer: RepairListSerializer
    end

    def create
        
        ActiveRecord::Base.transaction do
            CustomerRepairList.where(customer: @customer).update(is_active: false)
            @repair_list = CustomerRepairList.create!(name: 'Version '+((RepairList.count+1).to_s), \
                is_active: true, customer: @customer)
        end
        
        if @repair_list.save
            render json: @repair_list, serializer: RepairListSerializer
        else
            render json: { error: 'Could not create new Repair List'}, status: :unprocessable_entity
        end
    end

    def version_activation
        ActiveRecord::Base.transaction do
            # CustomerRepairList.update(is_active: false)
            @repair_list = CustomerRepairList.find(params[:id])
            @repair_list.customer.customer_repair_lists.update(is_active: false)
            @repair_list.update!(is_active: true)
            # puts @repair_list.to_json
        end
        render json: @repair_list, serializer: RepairListSerializer
    end
    private

    def set_customer
        @customer = Customer.find(params[:customer_id])
    end

end