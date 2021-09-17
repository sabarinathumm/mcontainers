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

    scope :filter_by_container_repair_area_id, -> (id) { where container_repair_area_id: id}
    scope :filter_by_container_damaged_area_id, -> (id) { where container_damaged_area_id: id}
    scope :filter_by_repair_type_id, -> (id) { where repair_type_id: id}

    def set_uid
        self.uid = loop do
              uid = 'RID' + self.repair_list.id.to_s + SecureRandom.random_number(99999).to_s
              break uid unless RepairListItem.exists?(uid: uid)
          end

        self.save!
    end

    def self.export(options = {})
        CSV.generate(options) do |csv|
          csv << %w{uid container_repair_area container_damaged_area repair_type is_non_mearsk_not_applicable non_mearsk_hours non_mearsk_material_cost non_mearsk_description comp rep dam component event location unit length width non_mearsk_id_source is_mearsk_not_applicable mearsk_max_material_cost mearsk_unit_material_cost mearsk_hours_per_unit mesrsk_max_pieces mearsk_units repair_mode mode_number repair_code combined mearsk_description mearsk_id_source}
          all.each do |repair_list_item|
            csv << [ repair_list_item.uid, \
                repair_list_item.container_repair_area.present? ? repair_list_item.container_repair_area.name : nil, \
                repair_list_item.container_damaged_area.present? ? repair_list_item.container_damaged_area.name :  nil, \
                repair_list_item.repair_type.present? ? repair_list_item.repair_type.name : nil,
                repair_list_item.is_non_mearsk_not_applicable, repair_list_item.non_mearsk_hours, repair_list_item.non_mearsk_material_cost.dollars, repair_list_item.non_mearsk_description, \
                repair_list_item.comp.present? ? repair_list_item.comp.name : nil, \
                repair_list_item.rep.present? ? repair_list_item.rep.name: nil, \
                repair_list_item.dam.present? ? repair_list_item.dam.name: nil, \
                repair_list_item.component.present? ? repair_list_item.component.name : nil, \
                repair_list_item.event.present?  ? repair_list_item.event.name: nil, \
                repair_list_item.location, \
                repair_list_item.unit.present?  ? repair_list_item.unit.name: nil, \
                repair_list_item.length, repair_list_item.width, repair_list_item.non_mearsk_id_source, repair_list_item.is_mearsk_not_applicable, repair_list_item.mearsk_max_material_cost.dollars, \
                repair_list_item.mearsk_unit_material_cost.dollars, repair_list_item.mearsk_hours_per_unit, \
                repair_list_item.mesrsk_max_pieces, repair_list_item.mearsk_units, \
                repair_list_item.repair_mode.present?  ? repair_list_item.repair_mode.name: nil, \
                repair_list_item.mode_number.present?  ? repair_list_item.mode_number.name: nil, \
                repair_list_item.repair_code, repair_list_item.combined, repair_list_item.mearsk_description, repair_list_item.mearsk_id_source ]
          end
        end
    end

    def self.import(repair_list_item_upload, repair_list_id)
        success = ActiveRecord::Base.transaction do
            spreadsheet = open_spreadsheet(repair_list_item_upload.attachment.file)
            header = spreadsheet.row(1)

            (2..spreadsheet.last_row).each do |i|
                row = Hash[[header, spreadsheet.row(i)].transpose]
                if row['uid'].present? && RepairListItem.find_by(uid: row['uid']).present?
                    repair_list_item = RepairListItem.find_by(uid: row['uid'])
                else
                    repair_list_item = RepairListItem.new(repair_list_id: repair_list_id )
                end
                repair_list_item.container_repair_area = ContainerRepairArea.find_by(name: row['container_repair_area']) unless row['container_repair_area'].blank?
                repair_list_item.container_damaged_area = ContainerDamagedArea.where(name: row['container_damaged_area']).first  unless row['container_damaged_area'].blank?
                repair_list_item.repair_type = RepairType.where(name: row['repair_type']).first  unless row['repair_type'].blank?
                repair_list_item.comp = Comp.where(name: row['comp']).first  unless row['comp'].blank?
                repair_list_item.rep = Rep.where(name: row['rep']).first  unless row['rep'].blank?
                repair_list_item.dam = Dam.where(name: row['dam']).first  unless row['dam'].blank?
                repair_list_item.component = Component.where(name: row['component']).first  unless row['component'].blank?
                repair_list_item.unit = Unit.where(name: row['unit']).first  unless row['unit'].blank?
                repair_list_item.event = Event.where(name: row['event']).first  unless row['event'].blank?
                repair_list_item.mode_number = ModeNumber.where(name: row['mode_number']).first  unless row['mode_number'].blank?
                repair_list_item.repair_mode = RepairMode.where(name: row['repair_mode']).first  unless row['repair_mode'].blank?
                repair_list_item.is_non_mearsk_not_applicable = row['is_non_mearsk_not_applicable']
                repair_list_item.non_mearsk_hours = row['non_mearsk_hours']
                repair_list_item.non_mearsk_material_cost = row['non_mearsk_material_cost']
                repair_list_item.non_mearsk_description = row['non_mearsk_description']
                repair_list_item.location = row['location']
                repair_list_item.length = row['length']
                repair_list_item.width = row['width']
                repair_list_item.non_mearsk_id_source = row['non_mearsk_id_source']
                repair_list_item.mearsk_max_material_cost = row['mearsk_max_material_cost']
                repair_list_item.mearsk_unit_material_cost = row['mearsk_unit_material_cost']
                repair_list_item.mearsk_hours_per_unit = row['mearsk_hours_per_unit']
                repair_list_item.mesrsk_max_pieces = row['mesrsk_max_pieces']
                repair_list_item.mearsk_units = row['mearsk_units']
                repair_list_item.repair_code = row['repair_code']
                repair_list_item.combined = row['combined']
                repair_list_item.mearsk_description = row['mearsk_description']
                repair_list_item.mearsk_id_source = row['mearsk_id_source']

                repair_list_item.save!
            end
            repair_list_item_upload.destroy!
        end

        unless success
            raise ActiveRecord::Rollback
        end

    end

    def self.open_spreadsheet(attachment)
        case File.extname(attachment.original_filename)
        when ".csv" then Roo::CSV.new(attachment.path, csv_options: {encoding: "iso-8859-1:utf-8"})
        when ".xls" then Roo::Excel.new(attachment.path, nil, :ignore)
        when ".xlsx" then Roo::Excelx.new(attachment.path, nil, :ignore)
        else raise "Unknown file type: #{attachment.original_filename}"
        end
    end

end
