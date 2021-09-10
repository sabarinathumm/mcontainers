class Api::V1::Meta::RepairTypesController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @repair_types = RepairType.all
        render json: @repair_types, each_serializer: MetaSerializer
    end

end