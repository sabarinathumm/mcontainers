class Api::V1::Meta::ProvincesController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @provinces = Province.all
        render json: @provinces, each_serializer: MetaSerializer
    end

end