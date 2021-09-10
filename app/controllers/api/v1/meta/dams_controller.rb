class Api::V1::Meta::DamsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @dams = Dam.all
        render json: @dams, each_serializer: MetaSerializer
    end

end