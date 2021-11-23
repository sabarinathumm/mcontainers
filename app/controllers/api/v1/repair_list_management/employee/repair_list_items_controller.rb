class Api::V1::RepairListManagement::Employee::RepairListItemsController < Api::V1::RepairListManagement::Shared::RepairListItemsController
    private

    def set_admin
        @admin = current_admin
    end
end