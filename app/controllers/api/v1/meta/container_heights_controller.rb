class Api::V1::Meta::ContainerHeightsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @container_heights = ContainerHeight.all
        render json: @container_heights, each_serializer: MetaSerializer
    end

end