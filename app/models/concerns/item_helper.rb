module ItemHelper

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

end