class Api::V1::UserManagement::Admin::CustomersController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_admin!
    before_action :set_customer, only: [:update, :show]

    def index
        @customers = paginate Customer.all
        render json: @customers, each_serializer: CustomerSerializer, meta: pagination_dict(@customers)
    end

    def create
        if customer_params[:password].nil?
            customer_create_params = customer_params.merge!(password:'Password@123')
        else
            customer_create_params = customer_params
        end

        success = ActiveRecord::Base.transaction do
            @customer = Customer.create!(customer_create_params)
            
            if params[:customer][:repair_list_id].present? && params[:customer][:repair_list_id] != nil && params[:customer][:repair_list_id] != 0
                @repair_list = CustomerRepairList.find(params[:customer][:repair_list_id])
                @customer_repair_list = CustomerRepairList.create!(customer: @customer, name: "#{@customer.full_name} Version 1", is_active: true)
                @repair_list.customer_repair_list_items.each do |item|
                    @customer_repair_list.customer_repair_list_items.create!(item.attributes.except("id", "created_at", "updated_at", "customer_repair_list_id"))
                end
            else
                @repair_list = RepairList.where(is_active: true).first
                @customer_repair_list = CustomerRepairList.create!(customer: @customer, name: "#{@customer.full_name} #{@repair_list.name}", is_active: true)
                @repair_list.repair_list_items.each do |item|
                    @customer_repair_list.customer_repair_list_items.create!(item.attributes.except("id", "created_at", "updated_at", "repair_list_id"))
                end
            end
            
        end

        unless success
            throw_error("customer specific repair list not created", :unprocessable_entity)
        end

        render json: @customer, serializer: CustomerDetailedSerializer
    end

    def show
        render json: @customer, serializer: CustomerDetailedSerializer
    end

    def update
        @customer.update!(update_params)

        unless params[:customer][:repair_list_id].nil?
            ActiveRecord::Base.transaction do
                CustomerRepairList.where(customer: @customer).update(is_active: false)

                if params[:customer][:repair_list_id] != 0
                    @repair_list = CustomerRepairList.find(params[:customer][:repair_list_id])
                    @customer_repair_list = CustomerRepairList.create!(customer: @customer, name: "#{@customer.full_name} Version 1", is_active: true)
                    @repair_list.customer_repair_list_items.each do |item|
                        @customer_repair_list.customer_repair_list_items.create!(item.attributes.except("id", "created_at", "updated_at", "customer_repair_list_id"))
                    end
                else
                    @repair_list = RepairList.where(is_active: true).first
                    @customer_repair_list = CustomerRepairList.create!(customer: @customer, name: "#{@customer.full_name} #{@repair_list.name}", is_active: true)
                    @repair_list.repair_list_items.each do |item|
                        @customer_repair_list.customer_repair_list_items.create!(item.attributes.except("id", "created_at", "updated_at", "repair_list_id"))
                    end
                end

            end
        end

        render json: @customer, serializer: CustomerDetailedSerializer
    end
     
    private

    def set_admin
        @admin = current_admin
    end

    def set_customer
        @customer = Customer.find(params[:id])
    end

    def customer_params
        params.require(:customer).permit(:full_name, :email, :owner_name, :billing_name, :hourly_rate, :gst, :pst, :city_id, \
            :province_id, :address, :zipcode, :password, :is_active, :customer_type)
    end

    def update_params
        params.require(:customer).permit(:full_name, :email, :owner_name, :billing_name, :hourly_rate, :gst, :pst, :city_id, \
            :province_id, :address, :zipcode, :password, :is_active, :customer_type)

    end
end