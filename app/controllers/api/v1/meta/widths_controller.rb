class WidthsController < ApplicationController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @widths = Width.all
        render json: @widths, each_serializer: MetaSerializer
    end
end
