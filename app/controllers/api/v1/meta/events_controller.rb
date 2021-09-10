class Api::V1::Meta::EventsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!

    def index
        @events = Event.all
        render json: @events, each_serializer: MetaSerializer
    end

end