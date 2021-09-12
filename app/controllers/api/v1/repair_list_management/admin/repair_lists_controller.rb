class Api::V1::RepairListManagement::Admin::RepairListsController < Api::V1::RepairListManagement::Shared::RepairListsController
    private

    def set_admin
        @admin = current_admin
    end
end