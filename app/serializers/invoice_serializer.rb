class InvoiceSerializer < ActiveModel::Serializer
    attributes :id, :invoice_number, :status, :created_at, :total_labour_hours, :parts_cost, :total_labour_cost , :subtotal_repair_cost, :invoice_total 


    belongs_to :activities, serializer: ActivitySerializer
    belongs_to :customer, serializer: CustomerSerializer
    belongs_to :customer, serializer: CustomerDetailedSerializer

    has_many :invoice_activity_items, each_serializer: InvoiceActivityItemSerializer

    def created_at
        object.created_at.strftime("%d-%b-%Y")
    end

end  