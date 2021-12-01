class ActivityItem < ApplicationRecord
    belongs_to :activity
    belongs_to :length, optional: true
    belongs_to :width, optional: true
    belongs_to :container_repair_area
    belongs_to :container_damaged_area
    belongs_to :repair_type
    belongs_to :unit

    belongs_to :damaged_area_image, class_name: 'UploadedFile', optional: true
    belongs_to :repaired_area_image, class_name: 'UploadedFile', optional: true

    # validates :location, presence: false, format: { with: /^[DF][BHGTX][1-4X][2-4NX]|[LR][BHGTX][0-9X][02-9XN]|[TUB][LXR][0-9X][02-9XN]|[XEI][X][X][X]$/ , multiline: true }, on: :create
    validates :location, presence: false, allow_blank: true, format: { with: /^[DF][BHGTX][1-4X][2-4NX]|[LR][BHGTX][0-9X][02-9XN]|[TUB][LXR][0-9X][02-9XN]|[XEI][X][X][X]$/ , multiline: false }, on: :create
    validates :location, presence: false, allow_blank: true, format: { with: /^[DF][BHGTX][1-4X][2-4NX]|[LR][BHGTX][0-9X][02-9XN]|[TUB][LXR][0-9X][02-9XN]|[XEI][X][X][X]$/ , multiline: false }, on: :update
    monetize :labour_cost_cents
    monetize :material_cost_cents
    monetize :total_cost_cents

    def location_required?
        false
    end
end
