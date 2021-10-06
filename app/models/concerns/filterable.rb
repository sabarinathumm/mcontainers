module Filterable
    extend ActiveSupport::Concern
  
    module ClassMethods
      def filters(filter_params)
        results = self.where(nil)
        filter_params.each do |key, value|
          results = results.public_send("filter_by_#{key}", value) if value.present?
        end
        results
      end
    end
end