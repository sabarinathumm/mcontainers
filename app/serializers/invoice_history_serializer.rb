class InvoiceHistorySerializer < ActiveModel::Serializer
    attributes :id, :invoice_number, :status, :created_at, :invoice_id

    belongs_to :activity, serializer: ActivitySerializer
    # belongs_to :invoice, serializer: InvoiceSerializer
    # has_many :invoice_activity_items, each_serializer: InvoiceActivityItemSerializer

    def created_at
        object.invoice.created_at.strftime("%d-%b-%Y")
    end

    def invoice_number
        object.invoice.invoice_number
    end

    def status
        object.invoice.status
    end

    def invoice_id
        object.invoice.id
    end
end  