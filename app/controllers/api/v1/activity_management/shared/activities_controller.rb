class Api::V1::ActivityManagement::Shared::ActivitiesController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_container, only: [:container_activity]

    def index
        @activities = Activity.all.search_by(params[:search_text]).filters(filter_params)
        render json:  @activities, each_serializer: ActivitySerializer
    end

    def container_activity
        @activities = @container.activities
        render json:  @activities, each_serializer: ActivitySerializer
    end

    private

    def set_container
        @container = Container.find(params[:container_id])
    end

    def filter_params
        params.permit(:date, :activity_type, :activity_status, :yard_id, :customer_id)
    end

end