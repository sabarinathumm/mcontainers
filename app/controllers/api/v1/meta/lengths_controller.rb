class Api::V1::Meta::LengthsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @lengths = Length.all
        render json: @lengths, each_serializer: MetaSerializer
    end

end