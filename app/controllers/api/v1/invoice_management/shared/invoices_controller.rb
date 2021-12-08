class Api::V1::InvoiceManagement::Shared::InvoicesController < Api::V1::BaseController

    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_format, only: [:export_common]
    before_action :set_invoice, only: [:show]

    def index
        @activities = Activity.all.where(activity_status:'ready_for_billing').filters(filter_params).search_by(params[:search_text]).sorts(sort_params)  
        @activities = paginate @activities.page(params[:page])
        # puts @activities.to_json
        render json: @activities, each_serializer: ActivitySerializer, meta: pagination_dict(@activities)
    end

    def export_common

        @activities = Activity.where(id: export_params[:activity_ids])
        @containers = Container.where(id: @activities.pluck(:container_id))
        @customers = Customer.where(id: @containers.pluck(:customer_id))
       
        if @customers.first.billing_type == 'common'
            result = CommonExportJob.perform_now(export_params[:activity_ids])
                csv_data = CSV.generate do |csv|
                    csv << [result[0]]
                    result[1].each do |line|
                        csv << [line]
                    end
                end
            send_data csv_data, filename: "Invoice_#{Date.today.to_s}.csv", disposition: :attachment, type: "text/csv", status: :ok  
        else
            result = MscExportJob.perform_now(export_params[:activity_ids])
                csv_data = CSV.generate do |csv|
                    csv << [result[0]]
                    result[1].each do |line|
                        csv << [line]
                    end
                end
            send_data csv_data, filename: "Invoice_#{Date.today.to_s}.csv", disposition: :attachment , type: "text/csv", status: :ok
        end

    end

    def create
        puts "create"
        @activity = Activity.find(params[:activity_id])
        # puts @activity
        @activity.activity_status = 'billed'
        # puts @activity.to_json
        ActiveRecord::Base.transaction do
            @invoice = Invoice.new(invoice_params)
            # puts @invoice.to_json
            if @invoice.save
                # puts @invoice.to_json
                render json: @invoice, serializer: InvoiceSerializer, status: :created
            else
                throw_error(@invoice.error.full_messages, :unprocessible_entity)    
            end 
        end
        # render json:  @activity, each_serializer: ActivitySerializer, status: :created
    end

    def invoice_history
        puts "invoice_history"
        @activities = Activity.where(activity_status: 'billed').search_by(params[:search_text])

        @activities = paginate @activities.page(params[:page])
        render json: @activities, each_serializer: InvoiceSerializer, meta: pagination_dict(@invoices)
    end

    def show
        render json:  @invoice, serializer: InvoiceSerializer
    end

    def mark_void
        @invoice.status = 'void' unless @invoice.status == 'invoiced'
       
    end

    # def mail_invoice
        
    # end

    # def print_invoice
        
    # end

    def invoice_params
        params.permit(:status, :created_at, :invoice_number)
    end
    
    def filter_params
        params.permit(:date, :activity_type, :activity_status, :yard_id, :customer_id, :status, :container_id)
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

    def set_invoice
        @invoice = Invoice.find(params[:id])
    end
end