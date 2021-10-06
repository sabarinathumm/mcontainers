class ActivityItem < ApplicationRecord
    belongs_to :activity

    belongs_to :container_repair_area
    belongs_to :container_damaged_area
    belongs_to :repair_type

    monetize :labour_cost_cents
    monetize :material_cost_cents
    monetize :total_cost_cents
end
