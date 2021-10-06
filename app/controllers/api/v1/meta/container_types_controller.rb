class Api::V1::Meta::ContainerTypesController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @container_types = ContainerType.all
        render json: @container_types, each_serializer: MetaSerializer
    end

end