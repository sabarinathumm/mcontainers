class Api::V1::InvoiceManagement::Shared::InvoicesController < Api::V1::BaseController

    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_format, only: [:export_common]
    before_action :set_activity, only: [:show]

    def index
        @activities = Activity.all.filters(filter_params).search_by(params[:search_text]).sorts(sort_params)  
        # @activities = Activity.where(activity_status: 'ready_for_billing')
        # puts "HI"
        puts @activities.to_json
        render json: @activities, each_serializer: ActivitySerializer
    end

    def show
        render json:  @activity, serializer: ActivitySerializer
    end

    def export_common
       
        @activities = Activity.where(id: export_params[:activity_ids])
      
        @containers = Container.where(id: @activities.pluck(:container_id))

        # @activity_items = @activities.activity_items.where(id: activity_ids)
        # puts "Activity Items"
        # puts @activity_items.to_json
       
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
    
    def filter_params
        params.permit( :activity_status)
    end

    def sort_params
        params.permit(:yard_name, :owner_name, :activity_status_sort, :activity_type_sort, :customer_name, :created_at, :activity_uid, :sub_total)
    end

    def set_format
        request.format = 'csv'
    end

    def export_params
        params.permit(activity_ids: [])
    end

    def set_activity
        @activity = Activity.find(params[:id])
    end
end