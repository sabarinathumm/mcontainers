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
        @activities = Activity.where(id: params[:activity_ids])
        @invoices = []
        @activities.each do |activity|
            invoice = Invoice.new
            invoice_item = InvoiceActivityItem.new
            ActiveRecord::Base.transaction do
                activity.update!(activity_status: 'billed')
                # @invoice = Invoice.new(status: 'invoiced', invoice_number: 'INV7678')
                invoice = activity.invoices.create!(status: 'invoiced')
                # puts activity.activity_items.to
                activity.activity_items.each do |item|
                    invoice_item = invoice.invoice_activity_items.create!(item.attributes.except("id", "created_at", "updated_at", "activity_id", "labour_cost_cents", "labour_cost_currency","material_cost_cents", "material_cost_currency","total_cost_cents", "total_cost_currency", "damaged_area_image_id", "repaired_area_image_id","comments","unit_id","length_id","width_id"))
                end
            end
            @invoices << invoice 
            @invoices << invoice_item
        end
        render json: @invoices.to_json , status: :created
       
    end

    def invoice_history
        @activity = Activity.where(activity_status: 'billed').search_by(params[:search_text]).first
        @invoices = ActivitiesInvoice.where(activity_id: @activity.id)
        @invoices = paginate @invoices.page(params[:page])
        render json: @invoices, each_serializer: InvoiceHistorySerializer
    end

    def show
        render json:  @invoice, serializer: InvoiceHistorySerializer
    end

    def mark_void
        @invoice = Invoice.where(id: params[:invoice_ids])
        @invoice.update(status: params[:status])
        render json: @invoice
        # , serializer: InvoiceSerializer
    end

    def mail_invoice
        
    end

    # def print_invoice
    #     respond_to do |format|
    #         # format.html
    #         format.pdf do
    #             render pdf: "Invoice No. #{@invoice.id}",
    #             page_size: 'A4',
    #             # template: "invoices/show.html.erb",
    #             layout: "pdf.html",
    #             orientation: "Landscape",
    #             # lowquality: true,
    #             # zoom: 1,
    #             # dpi: 75
    #         end
    #     end
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

    def set_print_format
        request.format = 'pdf'
    end

    def export_params
        params.permit(activity_ids: [])
    end

    def set_activity
        @activity = Activity.find(params[:id])
    end

    def set_invoice
        @invoice = Invoice.find(params[:id])
        puts "setInvoice"
    end
end