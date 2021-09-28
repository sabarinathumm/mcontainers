class CustomerSerializer < ActiveModel::Serializer
    attributes :id, :full_name, :owner_name, :billing_name, :email, :is_active, :hourly_rate_dollars, :hourly_rate_cents, :hourly_rate_currency

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