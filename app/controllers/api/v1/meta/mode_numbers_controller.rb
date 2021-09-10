class Api::V1::Meta::ModeNumbersController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @mode_numbers = ModeNumber.all
        render json: @mode_numbers, each_serializer: MetaSerializer
    end

end