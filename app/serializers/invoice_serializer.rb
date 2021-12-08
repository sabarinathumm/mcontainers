class InvoiceSerializer < ActiveModel::Serializer
    attributes :id, :invoice_number, :activity_ids, :status, :created_at

    belongs_to :activities, serializer: ActivitySerializer
    has_many :invoice_activity_items, each_serializer: InvoiceActivityItemSerializer

    def created_at
        object.created_at.strftime("%d-%b-%Y")
    end

end  