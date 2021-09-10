class Api::V1::Meta::CompsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @comps = Comp.all
        render json: @comps, each_serializer: MetaSerializer
    end

end