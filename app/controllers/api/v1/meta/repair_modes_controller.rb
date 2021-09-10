class Api::V1::Meta::RepairModesController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @repair_modes = RepairMode.all
        render json: @repair_modes, each_serializer: MetaSerializer
    end

end