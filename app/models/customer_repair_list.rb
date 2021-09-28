class CustomerRepairList < ApplicationRecord
    belongs_to :customer
    has_many :customer_repair_list_items
end
