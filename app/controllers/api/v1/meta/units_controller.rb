class Api::V1::Meta::UnitsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @units = Unit.all
        render json: @units, each_serializer: MetaSerializer
    end

end