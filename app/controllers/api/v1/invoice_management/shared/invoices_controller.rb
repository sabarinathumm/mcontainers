class Api::V1::InvoiceManagement::Shared::InvoicesController < Api::V1::BaseController

    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_format, only: [:export_common]

    def index
        # @activities = Activity.all.filters(filter_params).search_by(params[:search_text]).sorts(sort_params)  
        @activities = Activity.where(activity_status: 'ready_for_billing')
        # puts "HI"
        # puts @activities.to_json
        render json: @activities, each_serializer: ActivitySerializer
    end

    def show
        render json:  @invoice, serializer: ActivitySerializer
    end

    def export_common
       
        @activities = Activity.where(id: export_params[:activity_ids])
      
        @containers = Container.where(id: @activities.pluck(:container_id))
       
        @customers = Customer.where(id: @containers.pluck(:customer_id))
       
        if @customers.first.billing_type == 'common'
            if common = CommonExportJob.perform_now(export_params[:activity_ids])
                # common = CommonExportJob.perform_now(export_params[:activity_ids])
               puts common.to_json
                CSV.generate do |csv|
                    csv << [ common[:message_header]]
                end
            else
                render json: { success: false }
            end
        else
            if msc = MscExportJob.perform_now(export_params[:activity_ids])
                # msc = MscExportJob.perform_now(export_params[:activity_ids])
            #   puts  msc.message_header
                CSV.generate do |csv|
                    csv << [  msc.first.message_header, msc.date_time_ref, msc.references, msc.alternative_curr_amt_std, msc.alternative_curr_amt_dpp, msc.labour_cost, msc.name_addr_receiver, msc.equipment_details, msc.equipment_related_info, msc.equipment_condition_info, msc.current_usage_info ]
                end
            else
                render json: { success: false }
            end
        end

    end
    


    def set_format
        request.format = 'csv'
    end

    def export_params
        params.permit(activity_ids: [])
    end
end