class Api::V1::UserManagement::Admin::ProfilesController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_admin, only: [:show, :update, :delete]
    # before_action :set_activity_item, only: [:show, :update, :delete]

    def index    
        if params[:role] == 'administrator'
            @admins = Admin.where(role: 'administrator').search_by(params[:search_text])
            @admins = paginate @admins.page(params[:page])
            # puts "INDEX"
            # puts @admins.to_json
            render json: @admins, each_serializer: AdminSerializer, meta: pagination_dict(@admins)
        else
            # puts "INDEX"
            @admins = Admin.where(role: 'employee').search_by(params[:search_text])
            # puts "INDEX"
            @admins = paginate @admins.page(params[:page])
            # puts @admins.to_json
            render json: @admins, each_serializer: AdminSerializer, meta: pagination_dict(@admins)
        end
    end

    def create
        @admin = Admin.create!(admin_params)
        render json: @admin, serializer: AdminSerializer
    end

    def update   
        @admin.update!(admin_params)
        render json:  @admin, serializer: AdminSerializer
    end

    def show
        render json:  @admin, serializer: AdminSerializer
    end

    def delete
        @admin.destroy! unless current_admin != @admin
    end

    private

    def set_admin
        @admin = Admin.find(params[:id])
    end

    def filter_params
        params.permit(:role, :customer_id, :status, :container_id)
    end
    def admin_params
        params.permit(:role, :email, :first_name, :password, :last_name, :phone_number, :is_active)
    end

end