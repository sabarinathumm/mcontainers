class RepairListItemSerializer < ActiveModel::Serializer
    attributes :id, :uid, :is_non_mearsk_not_applicable, :non_mearsk_hours, :non_mearsk_material_cost, \
        :non_mearsk_description, :non_mearsk_id_source, :location, :length, :width, :is_mearsk_not_applicable, \
        :mearsk_max_material_cost, :mearsk_unit_material_cost, :mearsk_hours_per_unit, :mearsk_hours_per_unit, \
        :mesrsk_max_pieces, :mearsk_units, :repair_code, :combined, :mearsk_id_source, :mearsk_description, :deleted_at
    
    belongs_to :container_repair_area, serializer: MetaSerializer
    belongs_to :container_damaged_area, serializer: MetaSerializer
    belongs_to :repair_type, serializer: MetaSerializer
    belongs_to :comp, serializer: MetaSerializer
    belongs_to :rep, serializer: MetaSerializer
    belongs_to :dam, serializer: MetaSerializer
    belongs_to :event, serializer: MetaSerializer
    belongs_to :unit, serializer: MetaSerializer
    belongs_to :repair_mode, serializer: MetaSerializer
    belongs_to :mode_number, serializer: MetaSerializer
    belongs_to :component, serializer: MetaSerializer

end