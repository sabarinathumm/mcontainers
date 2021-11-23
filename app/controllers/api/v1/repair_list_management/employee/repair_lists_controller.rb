class Api::V1::RepairListManagement::Employee::RepairListsController < Api::V1::RepairListManagement::Shared::RepairListsController
    private

    def set_admin
        @admin = current_admin
    end
end