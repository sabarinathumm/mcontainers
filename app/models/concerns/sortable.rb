module Sortable
    extend ActiveSupport::Concern
  
    module ClassMethods
      def sorts(sort_params)
        results = self.where(nil)
        sort_params.each do |key, value|
          results = results.public_send("sort_by_#{key}", value) if value.present?
        end
        results
      end
    end
end