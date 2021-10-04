class Api::V1::Meta::CitiesController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_province

    def index
        @cities = @province.cities
        render json: @cities, each_serializer: MetaSerializer
    end

    private

    def set_province
        @province = Province.find(params[:province_id])
    end

end