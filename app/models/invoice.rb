class Invoice < ApplicationRecord
    include Filterable
    include Sortable

    has_many :activities_invoices
    has_many :activities, through: :activities_invoices

    has_many :invoice_activity_items
    has_many :activity_items, through: :activities

    enum status: [:invoiced, :void]

    
    after_create :set_invoice_number

    def set_invoice_number
        invoice_number = 'IN'+rand(11111..99999).to_s
        if self.invoice_number == invoice_number
            uid = 'IN' + rand(11111..99999).to_s
        end
        # puts invoice_number.to_json
    end

end
