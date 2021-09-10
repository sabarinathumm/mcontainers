class Api::V1::Meta::ContainerRepairAreasController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @container_repair_areas = ContainerRepairArea.all
        render json: @container_repair_areas, each_serializer: MetaSerializer
    end

end