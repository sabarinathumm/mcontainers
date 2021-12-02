class Api::V1::Meta::ContainerLengthsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @container_lengths = ContainerLength.all
        render json: @container_lengths, each_serializer: MetaSerializer
    end

end