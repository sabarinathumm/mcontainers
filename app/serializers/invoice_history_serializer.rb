class InvoiceHistorySerializer < ActiveModel::Serializer
    attributes :id, :invoice_number, :activity_ids, :invoice_id, :status, :created_at

    belongs_to :activities, serializer: ActivitySerializer
    belongs_to :invoices, serializer: InvoiceSerializer
    has_many :invoice_activity_items, each_serializer: InvoiceActivityItemSerializer

    def created_at
        object.created_at.strftime("%d-%b-%Y")
    end

    def invoice_number
        object.invoice.invoice_number
    end
end  