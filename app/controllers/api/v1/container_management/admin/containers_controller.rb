class Api::V1::ContainerManagement::Admin::ContainersController < Api::V1::ContainerManagement::Shared::ContainersController
    before_action :set_admin

    private
    
    def set_admin
        @admin = current_admin
    end

end