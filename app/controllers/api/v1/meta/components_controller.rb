class Api::V1::Meta::ComponentsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @components = Component.all
        render json: @components, each_serializer: MetaSerializer
    end

end