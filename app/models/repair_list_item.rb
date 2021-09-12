class RepairListItem < ApplicationRecord
    belongs_to :repair_list

    belongs_to :container_repair_area, optional: true
    belongs_to :container_damaged_area, optional: true
    belongs_to :repair_type, optional: true
    belongs_to :component, optional: true
    belongs_to :comp, optional: true
    belongs_to :rep, optional: true
    belongs_to :dam, optional: true
    belongs_to :event, optional: true
    belongs_to :unit, optional: true
    belongs_to :repair_mode, optional: true
    belongs_to :mode_number, optional: true

    after_create :set_uid

    def set_uid
        self.uid = loop do
              uid = 'RID' + self.repair_list.id.to_s + SecureRandom.random_number(99999).to_s
              break uid unless RepairListItem.exists?(uid: uid)
          end
    end

end
