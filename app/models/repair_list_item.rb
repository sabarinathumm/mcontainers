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

    monetize :non_mearsk_material_cost_cents
    monetize :mearsk_max_material_cost_cents
    monetize :mearsk_unit_material_cost_cents

    after_create :set_uid

    def set_uid
        self.uid = loop do
              uid = 'RID' + self.repair_list.id.to_s + SecureRandom.random_number(99999).to_s
              break uid unless RepairListItem.exists?(uid: uid)
          end
    end

    def self.export(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
          all.each do |repair_list_item|
            csv << repair_list_item.attributes.values_at(*column_names)
          end
        end
    end

    def self.import(attachment)
        spreadsheet = open_spreadsheet(attachment.file)
        header = spreadsheet.row(1)

        (2..spreadsheet.last_row).each do |i|
            row = Hash[[header, spreadsheet.row(i)].transpose]
            repair_list_item = RepairListItem.new
            repair_list_item.attributes = row.to_hash
            repair_list_item.save!
        end

    end

    def open_spreadsheet(attachment)
        case File.extname(attachment.original_filename)
        when ".csv" then Csv.new(attachment.path, nil, :ignore)
        when ".xls" then Excel.new(attachment.path, nil, :ignore)
        when ".xlsx" then Excelx.new(attachment.path, nil, :ignore)
        else raise "Unknown file type: #{attachment.original_filename}"
        end
    end

end
