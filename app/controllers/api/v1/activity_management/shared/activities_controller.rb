class Api::V1::ActivityManagement::Shared::ActivitiesController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_container, only: [:container_activity, :create]
    before_action :set_activity, only: [:show, :delete, :update,]
    before_action :set_format, only: [:export]

    def index    
        @activities = Activity.all.filters(filter_params).search_by(params[:search_text]).sorts(sort_params)  
        @activities = paginate @activities.page(params[:page])
        render json:  @activities, each_serializer: ActivitySerializer, meta: pagination_dict(@activities)
    end

    def container_activity
        @activities = @container.activities.where.not(activity_status: ['idle','deleted']).order(created_at: :desc)
        render json:  @activities, each_serializer: ActivitySerializer
    end

    def activity_status

        @activity = Activity.find(params[:activity_id])

        if @activity.activity_status == 'quote_draft'
            render json: {activity_statuses: ['quote_issued']}
        elsif @activity.activity_status == 'quote_issued'
            render json: {activity_statuses: ['quote_draft', 'pending_admin_approval']}
        elsif @activity.activity_status == 'pending_admin_approval'
            render json: {activity_statuses:['quote_draft', 'pending_customer_approval']}
        elsif @activity.activity_status == 'pending_customer_approval'
            render json: {activity_statuses: ['quote_draft','ready_for_repair']}
        elsif @activity.activity_status == 'ready_for_repair'
            render json: {activity_statuses: ['quote_draft','repair_draft']}
        elsif @activity.activity_status == 'repair_draft'
            render json: {activity_statuses: ['repair_done']}
        elsif @activity.activity_status == 'repair_done'
            render json: {activity_statuses: ['ready_for_billing','repair_draft']}
        elsif @activity.activity_status == 'ready_for_billing'
            render json: {activity_statuses: ['repair_done','billed'] }
        elsif @activity.activity_status == 'billed'
            render json: {activity_statuses: ['repair_done']}
        end
    end

    def create
        if activity_params[:activity_type] == 'quote'
            status = 'quote_draft'
        elsif activity_params[:activity_type] == 'repair'
            status = 'repair_draft'
        end

        activity_create_params = activity_params.merge(assigned_to: current_admin, container: @container, activity_status: status)
       
        ActiveRecord::Base.transaction do
            @activity = Activity.create!(activity_create_params)
            ActivityTimeline.create!(activity: @activity, history_status: @activity.activity_status, history_date: @activity.activity_date)
            @activity.container.update!(container_status: 'active')
        end 

        if @activity.save
            render json: @activity, serializer: ActivitySerializer
        else
            render json: { error: 'Could not create new activity List'}, status: :unprocessable_entity
        end
    end 

    def show
        render json:  @activity, serializer: ActivitySerializer
    end

    def update       
        @activity.update!(activity_params)
        render json: @activity, serializer: ActivitySerializer       
    end

    def update_date 
        @activity = Activity.where(id: update_date_params[:activity_id]).first
        @activity.update(activity_date: update_date_params[:activity_date])

        render json: @activity, serializer: ActivitySerializer
    end
    

    def delete
        @activity.update!(activity_status: 'deleted')
        # Activity.destroy(params[:id])
    end

    def update_status
        @activities = Activity.where(id: update_status_params[:activity_ids])
        @activities.update(activity_status: update_status_params[:activity_status])
        render json: { succes: true }, status: :ok
    end

    def export
        activities = Activity.all.search_by(params[:search_text]).filters(filter_params)
        respond_to do |format|
            format.csv { send_data activities.export, filename: "Activities_#{Date.today}.csv", \
            type: "text/csv" , disposition: 'attachment', status: :ok }
        end

    end

    def auto_populate
        @repairlistitems = RepairListItem.where(uid: params[:repair_code])
        @repairlistitems.each do |item|
            if item.repair_list.is_active?
                render json: {container_repair_area_id: item.container_repair_area_id, container_damaged_area_id: item.container_damaged_area_id, repair_type_id: item.repair_type_id}
                break
            else
                throw_error('Item not available', :unprocessable_entity)
            end
        end
    end
    private

    def sort_params
        params.permit(:yard_name, :owner_name, :activity_status_sort, :activity_type_sort, :customer_name, :created_at, :activity_uid)
    end

    def set_format
        request.format = 'csv'
    end

    def set_container
        @container = Container.find(params[:container_id])
    end

    def set_activity
        @activity = Activity.find(params[:id])
    end

    def filter_params
        params.permit(:date, :activity_type, :activity_status, :yard_id, :customer_id, :status)
    end

    def update_status_params
        params.permit(:activity_status, activity_ids: []).tap do |update_status_params|
            update_status_params.require(:activity_status)
        end
    end

    def update_date_params
        params.permit(:activity_date, :activity_id)
    end

    def activity_params
        params.require(:activity).permit(:activity_type, :activity_date, :activity_status)
    end
end