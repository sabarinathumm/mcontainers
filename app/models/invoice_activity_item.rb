class InvoiceActivityItem < ApplicationRecord
    # belongs_to :activities
    belongs_to :container_repair_area
    belongs_to :container_damaged_area
    belongs_to :repair_type

    validates :location, presence: false, allow_blank: true, format: { with: /^[DF][BHGTX][1-4X][2-4NX]|[LR][BHGTX][0-9X][02-9XN]|[TUB][LXR][0-9X][02-9XN]|[XEI][X][X][X]$/ , multiline: true }, on: :create
    validates :location, presence: false, allow_blank: true, format: { with: /^[DF][BHGTX][1-4X][2-4NX]|[LR][BHGTX][0-9X][02-9XN]|[TUB][LXR][0-9X][02-9XN]|[XEI][X][X][X]$/ , multiline: true }, on: :update

    def location_required?
        false
    end
end
