class InvoiceActivityItemSerializer < ActiveModel::Serializer
    attributes :id, :created_at
  
    # def history_date
    #   object.history_date.strftime("%d-%b-%Y")
    # end
  end