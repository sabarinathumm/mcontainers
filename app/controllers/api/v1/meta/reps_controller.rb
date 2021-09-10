class Api::V1::Meta::RepsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @reps = Rep.all
        render json: @reps, each_serializer: MetaSerializer
    end

end