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

    def total_labour_hours
        @invoice_activity_items = self.invoice_activity_items
        @total_labour_hours = @invoice_activity_items.pluck(:hours)
        # puts "total_labour_hours"
        # puts @total_labour_hours.sum
        return @total_labour_hours.sum
    end

    def parts_cost
        @invoice_activity_items = self.invoice_activity_items
        @parts_cost = @invoice_activity_items.pluck(:material_cost)
        # puts "parts_cost"
        # puts @parts_cost.sum/100
        return @parts_cost.sum/100
    end

    def total_labour_cost
        @invoice_activity_items = self.invoice_activity_items
        @total_labour_cost = @invoice_activity_items.pluck(:labour_cost)
        # puts "total_labour_cost"
        # puts @total_labour_cost.sum/100
        return @total_labour_cost.sum/100
    end

    def subtotal_repair_cost
        @invoice_activity_items = self.invoice_activity_items
        @subtotal_repair_cost = @invoice_activity_items.pluck(:total_cost)
        # puts "subtotal_repair_cost"
        # puts @subtotal_repair_cost.sum/100
        return @subtotal_repair_cost.sum/100
    end

    def invoice_total
        @invoice_activity_items = self.invoice_activity_items
        @invoice_total = total_labour_hours * (subtotal_repair_cost + total_labour_cost + parts_cost)
        # puts "invoice_totaal"
        # puts @invoice_total
        @customer = self.customer
        # puts "customer"
        # puts @customer.to_json
        gst = @customer.gst
        # puts "gst"
        # puts gst
        pst = @customer.pst
        # puts "pst"
        # puts pst
        if gst.present? && pst.blank?
            @invoice_total = @invoice_total + (@invoice_total * gst)/100
        elsif gst.blank? && pst.present?
            @invoice_total = @invoice_total + (@invoice_total * pst)/100
        elsif gst.present? && pst.present?
            @invoice_total = @invoice_total + (@invoice_total * pst)/100
            @invoice_total = @invoice_total + (@invoice_total * gst)/100
            # puts @invoice_total.to_json
        else
            @invoice_total = @invoice_total
        end
        return @invoice_total
    end
end
