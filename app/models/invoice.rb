class Invoice < ApplicationRecord
    include Filterable
    include Sortable

    has_many :activities_invoices
    has_many :activities, through: :activities_invoices

    has_many :invoice_activity_items
    has_many :activity_items, through: :activities

    enum status: [:invoiced, :void]

    
    after_create :set_invoice_number

    def invoice_number
        
    end

end
