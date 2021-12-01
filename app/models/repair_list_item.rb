class RepairListItem < ApplicationRecord

    belongs_to :repair_list
    belongs_to :length, optional: true
    belongs_to :width, optional: true
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

    validates_uniqueness_of :uid, scope: :repair_list_id
    validates :location, presence: false, allow_blank: true, format: { with: /^[DF][BHGTX][1-4X][2-4NX]|[LR][BHGTX][0-9X][02-9XN]|[TUB][LXR][0-9X][02-9XN]|[XEI][X][X][X]$/ , multiline: true }, on: :create
    validates :location, presence: false, allow_blank: true, format: { with: /^[DF][BHGTX][1-4X][2-4NX]|[LR][BHGTX][0-9X][02-9XN]|[TUB][LXR][0-9X][02-9XN]|[XEI][X][X][X]$/ , multiline: true }, on: :update
    # after_create :set_uid
    before_update :check_not_applicable

    scope :filter_by_container_repair_area_id, -> (id) { where container_repair_area_id: id}
    scope :filter_by_container_damaged_area_id, -> (id) { where container_damaged_area_id: id}
    scope :filter_by_repair_type_id, -> (id) { where repair_type_id: id}

    # def set_uid
    #     self.uid = loop do
    #           uid = 'RID' + self.repair_list.id.to_s + SecureRandom.random_number(99999).to_s
    #           break uid unless RepairListItem.exists?(uid: uid)
    #       end

    #     self.save!
    # end

    def location_required?
        false

    end
    
    def check_not_applicable

        if self.is_non_mearsk_not_applicable == true
            self.non_mearsk_hours = nil
            self.non_mearsk_material_cost =  nil
            self.non_mearsk_description = nil
            self.comp = nil
            self.dam = nil
            self.rep = nil
            self.component = nil
            self.event = nil
            self.location = nil
            self.length = nil
            self.width = nil
            self.non_mearsk_id_source = nil
        end

        if self.is_mearsk_not_applicable == true
            self.mearsk_max_material_cost = nil
            self.mearsk_unit_material_cost = nil
            self.mearsk_hours_per_unit = nil
            self.mesrsk_max_pieces = nil
            self.mearsk_units = nil
            self.repair_mode = nil
            self.mode_number = nil
            self.repair_code = nil
            self.combined = nil
            self.mearsk_description = nil
            self.mearsk_id_source = nil
        end

    end

    def self.export(options = {})
        CSV.generate(options) do |csv|
          csv << %w{uid container_repair_area container_damaged_area repair_type is_non_mearsk_not_applicable non_mearsk_hours non_mearsk_material_cost non_mearsk_description non_mearsk_comp non_mearsk_rep non_mearsk_dam non_mearsk_component non_mearsk_event non_mearsk_location unit non_mearsk_length non_mearsk_width non_mearsk_id_source is_mearsk_not_applicable mearsk_max_material_cost mearsk_unit_material_cost mearsk_hours_per_unit mesrsk_max_pieces mearsk_units repair_mode mode_number repair_code combined mearsk_description mearsk_id_source }
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
                repair_list_item.length.present? ? repair_list_item.length.name: nil, repair_list_item.width.present? ? repair_list_item.width.name: nil, repair_list_item.non_mearsk_id_source, repair_list_item.is_mearsk_not_applicable, repair_list_item.mearsk_max_material_cost.dollars, \
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
                if row['uid'].present? && RepairListItem.find_by(uid: row['uid'], repair_list_id: repair_list_id).present?
                    repair_list_item = RepairListItem.find_by(uid: row['uid'], repair_list_id: repair_list_id)
                else
                    repair_list_item = RepairListItem.new(repair_list_id: repair_list_id, uid: row['uid'] )
                end
                repair_list_item.container_repair_area = ContainerRepairArea.find_by(name: row['container_repair_area']) unless row['container_repair_area'].blank?
                repair_list_item.container_damaged_area = ContainerDamagedArea.where(name: row['container_damaged_area']).first  unless row['container_damaged_area'].blank?
                repair_list_item.repair_type = RepairType.where(name: row['repair_type']).first  unless row['repair_type'].blank?
                repair_list_item.comp = Comp.where(name: row['non_mearsk_comp']).first  unless row['non_mearsk_comp'].blank?
                repair_list_item.rep = Rep.where(name: row['non_mearsk_rep']).first  unless row['non_mearsk_rep'].blank?
                repair_list_item.dam = Dam.where(name: row['non_mearsk_dam']).first  unless row['non_mearsk_dam'].blank?
                repair_list_item.component = Component.where(name: row['non_mearsk_component']).first  unless row['non_mearsk_component'].blank?
                repair_list_item.unit = Unit.where(name: row['unit']).first  unless row['unit'].blank?
                repair_list_item.event = Event.where(name: row['non_mearsk_event']).first  unless row['non_mearsk_event'].blank?
                repair_list_item.mode_number = ModeNumber.where(name: row['mode_number']).first  unless row['mode_number'].blank?
                repair_list_item.repair_mode = RepairMode.where(name: row['repair_mode']).first  unless row['repair_mode'].blank?
                repair_list_item.is_non_mearsk_not_applicable = row['is_non_mearsk_not_applicable']
                repair_list_item.non_mearsk_hours = row['non_mearsk_hours']
                repair_list_item.non_mearsk_material_cost = row['non_mearsk_material_cost']
                repair_list_item.non_mearsk_description = row['non_mearsk_description']
                repair_list_item.location = row['non_mearsk_location']
                repair_list_item.length = Length.where(name: row['non_mearsk_length']).first  unless row['non_mearsk_length'].blank?
                repair_list_item.width = Width.where(name: row['non_mearsk_width']).first  unless row['non_mearsk_width'].blank?
                # repair_list_item.length = row['non_mearsk_length'] 
                # repair_list_item.width = row['non_mearsk_width'] 
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
