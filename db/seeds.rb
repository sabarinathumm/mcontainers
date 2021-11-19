# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mlcan_excel = Roo::Spreadsheet.open(File.open(Rails.root.join('db/mlcan_meta.xlsx')), extension: :xlsx)
meta_sheet = mlcan_excel.sheet(1)

container_repair_areas = meta_sheet.column(2).compact

container_repair_areas.each do |cra|
    ContainerRepairArea.create!(name: cra)
end


container_damaged_areas = meta_sheet.column(3).compact

container_damaged_areas.each do |cra|
    ContainerDamagedArea.create!(name: cra)
end


units = meta_sheet.column(7).compact

(1..units.length-1).each do |i|
    Unit.create!(name: units[i])
end

repair_types = meta_sheet.column(4).compact

repair_types.each do |cra|
    RepairType.create!(name: cra)
end

comps = meta_sheet.column(8).compact

(1..comps.length-1).each do |i|
    Comp.create!(name: comps[i])
end

dams = meta_sheet.column(9).compact

(1..dams.length-1).each do |i|
    Dam.create!(name: dams[i])
end

events = meta_sheet.column(10).compact

(1..events.length-1).each do |i|
    Event.create!(name: events[i])
end

reps = meta_sheet.column(11).compact

(1..reps.length-1).each do |i|
    Rep.create!(name: reps[i])
end

components = meta_sheet.column(12).compact

(1..components.length-1).each do |i|
    Component.create!(name: components[i])
end

repair_modes = meta_sheet.column(19).compact

(1..repair_modes.length-1).each do |i|
    RepairMode.create!(name: repair_modes[i])
end

container_meta_sheet = mlcan_excel.sheet(2)

lengths = container_meta_sheet.column(1).compact

(1..lengths.length-1).each do |i|
Length.create!(name: lengths[i])
end

widths = container_meta_sheet.column(2).compact

(1..widths.length-1).each do |i|
Width.create!(name: widths[i])
end
yards = container_meta_sheet.column(4).compact

(1..yards.length-1).each do |i|
    Yard.create!(name: yards[i])
end

container_types = container_meta_sheet.column(3).compact

(1..container_types.length-1).each do |i|
    ContainerType.create!(name: container_types[i])
end

repair_items_sheet = mlcan_excel.sheet(0)


(2..repair_items_sheet.last_row).each do |i|
    row = repair_items_sheet.row(i)
    puts row[i]

    RepairList.create!(name: 'Version '+((RepairList.count+1).to_s), is_active: true) if RepairList.where(is_active: true).blank?

    repair_list_item = RepairListItem.new(repair_list: RepairList.find_by(is_active: true), uid: row[0] )

    repair_list_item.container_repair_area = ContainerRepairArea.find_by(name: row[1]) unless row[1].blank?
    repair_list_item.container_damaged_area = ContainerDamagedArea.where(name: row[2]).first  unless row[2].blank?
    repair_list_item.repair_type = RepairType.where(name: row[3]).first  unless row[3].blank?
    repair_list_item.comp = Comp.where(name: row[7]).first  unless row[7].blank?
    repair_list_item.rep = Rep.where(name: row[10]).first  unless row[10].blank?
    repair_list_item.dam = Dam.where(name: row[8]).first  unless row[8].blank?
    repair_list_item.component = Component.where(name: row[11]).first  unless row[11].blank?
    repair_list_item.unit = Unit.where(name: row[6]).first  unless row[6].blank?
    repair_list_item.event = Event.where(name: row[9]).first  unless row[9].blank?
    repair_list_item.mode_number = ModeNumber.where(name: row[24]).first  unless row[24].blank?
    repair_list_item.repair_mode = RepairMode.where(name: row[18]).first  unless row[18].blank?
    repair_list_item.non_mearsk_hours = row[12]
    repair_list_item.non_mearsk_material_cost = row[16]
    repair_list_item.non_mearsk_description = row[13]
    repair_list_item.location = row[14]
    repair_list_item.length = Length.where(name: row[4]).first  unless row[4].blank?
    repair_list_item.width = Width.where(name: row[5]).first  unless row[5].blank?
    repair_list_item.non_mearsk_id_source = row[15]
    repair_list_item.mearsk_max_material_cost = row[22]
    repair_list_item.mearsk_unit_material_cost = row[19]
    repair_list_item.mearsk_hours_per_unit = row[20]
    repair_list_item.mesrsk_max_pieces = row[23]
    repair_list_item.mearsk_units = row[21]
    repair_list_item.repair_code = row[17]
    repair_list_item.combined = row[25]
    repair_list_item.mearsk_description = row[26]
    repair_list_item.mearsk_id_source = row[27]

    repair_list_item.save!
end