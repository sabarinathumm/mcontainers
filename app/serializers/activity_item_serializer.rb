class ActivityItemSerializer < ActiveModel::Serializer
    attributes :id, :repair_code, :length, :width, :location, :hours, :labour_cost_cents, \
        :labour_cost_dollars, :labour_cost_currency, :material_cost_cents, :material_cost_dollars, :material_cost_currency, \
        :total_cost_cents, :total_cost_dollars, :total_cost_currency, :comments

    belongs_to :container_repair_area, serializer: MetaSerializer
    belongs_to :container_damaged_area, serializer: MetaSerializer
    belongs_to :repair_type, serializer: MetaSerializer
    belongs_to :unit, serializer: MetaSerializer
    belongs_to :damaged_area_image, serializer: UploadedFileSerializer
    belongs_to :repaired_area_image, serializer: UploadedFileSerializer

    def labour_cost_dollars
        object.labour_cost.dollars
    end

    def labour_cost_cents
        object.labour_cost.cents
    end

    def labour_cost_currency
        object.labour_cost.currency.iso_code
    end

    def material_cost_dollars
        object.material_cost.dollars
    end

    def material_cost_cents
        object.material_cost.cents
    end

    def material_cost_currency
        object.material_cost.currency.iso_code
    end

    def total_cost_dollars
        object.total_cost.dollars
    end

    def total_cost_cents
        object.total_cost.cents
    end

    def total_cost_currency
        object.total_cost.currency.iso_code
    end

end  