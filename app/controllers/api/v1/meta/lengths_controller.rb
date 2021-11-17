class LengthsController < ApplicationController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @lengths = Length.all
        render json: @length, each_serializer: MetaSerializer
    end
end
