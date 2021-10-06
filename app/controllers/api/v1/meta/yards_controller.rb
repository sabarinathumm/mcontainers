class Api::V1::Meta::YardsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @yards = Yard.all
        render json: @yards, each_serializer: MetaSerializer
    end

end