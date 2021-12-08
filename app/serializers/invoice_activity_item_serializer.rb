class InvoiceActivityItemSerializer < ActiveModel::Serializer
    attributes :id, :created_at
  
    belongs_to :invoices, serializer: InvoiceActivityItemSerializer
    # def history_date
    #   object.history_date.strftime("%d-%b-%Y")
    # end
  end