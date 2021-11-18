class Api::V1::Meta::WidthsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @widths = Width.all
        render json: @widths, each_serializer: MetaSerializer
    end
end
