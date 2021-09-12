class Api::V1::RepairListManagement::Admin::RepairListItemsController < Api::V1::RepairListManagement::Shared::RepairListItemsController
    private

    def set_admin
        @admin = current_admin
    end
end