class Invoice < ApplicationRecord
    include Filterable
    include Sortable

    has_and_belongs_to_many :activities
    has_many :invoice_activity_items

    enum status: [:invoiced, :void]

    
    # after_create :set_invoice_number

    # def invoice_number
        
    # end

end
