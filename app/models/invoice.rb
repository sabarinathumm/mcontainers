class Invoice < ApplicationRecord
    include Filterable
    include Sortable

    belongs_to :customer, optional: true
    has_many :activities_invoices
    has_many :activities, through: :activities_invoices

    has_many :invoice_activity_items
    has_many :activity_items, through: :activities

    enum status: [:invoiced, :void]

    
    after_create :set_invoice_number

    def set_invoice_number
        invoice_number = 'IN'+rand(1111111..9999999).to_s
        if self.invoice_number == invoice_number
            uid = 'IN' + rand(1111111..9999999).to_s
        end
        self.invoice_number = invoice_number
        self.save!
        # puts invoice_number.to_json
    end

end
