class Api::V1::InvoiceManagement::Shared::InvoicesController < Api::V1::BaseController

    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_format, only: [:export_common]

    def index
        # @activities = Activity.all.filters(filter_params).search_by(params[:search_text]).sorts(sort_params)  
        @activities = Activity.where(activity_status: 'billed')
        # puts "HI"
        # puts @activities.to_json
        render json: @activities, each_serializer: ActivitySerializer
    end

    def show
        render json:  @invoice, serializer: ActivitySerializer
    end

    def export_common
        @activities = Activity.where(id: params[:id])
        @containers = Container.where(id: @activities.pluck(:container_id))
        @customers = Customer.where(id: @containers.pluck(:customer_id))
        if @customers.first.billing_type == 'common'
            if CommonExportJob.perform_now(export_params[:activity_ids])
                render json: { success: true }
            else
                render json: { success: false }
            end
        else
            if MscExportJob.perform_now(export_params[:activity_ids])
                render json: { success: true }
            else
                render json: { success: false }
            end
        end

    end

    def set_format
        request.format = 'csv'
    end

    def export_params
        params.permit(:activity_ids)
    end
end