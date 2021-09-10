class Api::V1::Meta::ContainerDamagedAreasController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @container_damaged_areas = ContainerDamagedArea.all
        render json: @container_damaged_areas, each_serializer: MetaSerializer
    end

end