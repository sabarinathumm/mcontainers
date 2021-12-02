class CustomerDetailedSerializer < ActiveModel::Serializer
    attributes :id, :full_name, :email, :owner_name, :billing_name, :billing_type, :approval_type, :hourly_rate_dollars, :hourly_rate_cents, :hourly_rate_currency, \
        :gst, :pst, :address, :zipcode, :customer_repair_list, :is_active

    belongs_to :city, serializer: MetaSerializer
    belongs_to :province, serializer: MetaSerializer

    def hourly_rate_dollars
        object.hourly_rate.dollars
    end

    def hourly_rate_cents
        object.hourly_rate.cents
    end

    def hourly_rate_currency
        object.hourly_rate.currency.iso_code
    end
end  