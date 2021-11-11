class Api::V1::ActivityManagement::Shared::ActivityItemsController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_activity, only: [:index, :create]
    before_action :set_activity_item, only: [:show, :update, :delete]

    def index    
        @activity_items = @activity.activity_items
        render json:  @activity_items, each_serializer: ActivityItemSerializer
    end

    def create
        create_params = activity_item_params.merge(activity: @activity)
        @activity_item = ActivityItem.create!(create_params)
        render json:  @activity_item, serializer: ActivityItemSerializer
    end

    def update   
        @activity_item.update!(activity_item_params)
        render json:  @activity_item, serializer: ActivityItemSerializer
    end

    def show
        render json:  @activity_item, serializer: ActivityItemSerializer
    end

    def delete
        @activity_item.destroy!
    end

    private

    def set_activity
        @activity = Activity.find(params[:activity_id])
    end

    def set_activity_item
        @activity_item = ActivityItem.find(params[:id])
    end

    def activity_item_params
        params.require(:activity_item).permit(:repair_code, :length, :width, :unit_id, :location, :hours, :labour_cost, \
            :material_cost, :total_cost, :damaged_area_image_id, :repaired_area_image_id, :container_repair_area_id, :container_damaged_area_id, \
            :repair_type_id, :comments)
    end

end