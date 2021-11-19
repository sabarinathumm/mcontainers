class Api::V1::ActivityManagement::Shared::ActivitiesController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!
    before_action :set_container, only: [:container_activity, :create]
    before_action :set_activity, only: [:show, :delete, :update]
    before_action :set_format, only: [:export]
    before_action :set_repair_list, only: [:auto_populate, :auto_populate_damage_area, :auto_populate_repair_type, :auto_populate_length,:auto_populate_width,:auto_populate_unit, :auto_populate_all]

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
            render json: {activity_statuses: ['pending_admin_approval']}
        elsif @activity.activity_status == 'pending_admin_approval'
            render json: {activity_statuses:['quote_draft', 'pending_customer_approval']}
        elsif @activity.activity_status == 'pending_customer_approval'
            render json: {activity_statuses: ['quote_draft','ready_for_repair']}
        elsif @activity.activity_status == 'ready_for_repair'
            render json: {activity_statuses: ['quote_draft','repair_draft']}
        elsif @activity.activity_status == 'repair_draft'
            render json: {activity_statuses: ['ready_for_billing','repair_draft']}
        elsif @activity.activity_status == 'ready_for_billing'
            render json: {activity_statuses: ['billed'] }
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
    end

    def update_status
        @activities = Activity.where(id: update_status_params[:activity_ids])
        @activities.update(activity_status: update_status_params[:activity_status])
        render json: { succes: true }, status: :ok
    end

    def export
        activities = Activity.where(id: params[:id])
        respond_to do |format|
            format.csv { send_data activities.export, filename: "Activities_#{Date.today}.csv", \
            type: "text/csv" , disposition: 'attachment', status: :ok }
        end

    end

    def auto_populate
        @customer_repair_list_item = @customer_repair_list.customer_repair_list_items.where(uid: params[:repair_code]).first
        throw_error('Item not available', :unprocessable_entity) if @customer_repair_list_item.blank?
        item = @customer_repair_list_item
        if @customer.billing_type == 'common' 

            render json: { container_repair_area_id: item.container_repair_area_id, container_damaged_area_id: item.container_damaged_area_id, repair_type_id: item.repair_type_id, length_id: item.length_id, width_id: item.width_id, \
            labour_cost: (@customer.hourly_rate_cents * item.mearsk_hours_per_unit)/100, material_cost: item.non_mearsk_material_cost.dollars, total_cost: ((@customer.hourly_rate_cents * item.mearsk_hours_per_unit)/100) + (item.non_mearsk_material_cost_cents)/100, unit_id: item.unit_id, hours: item.mearsk_hours_per_unit}
        else
            render json: { container_repair_area_id: item.container_repair_area_id, container_damaged_area_id: item.container_damaged_area_id, repair_type_id: item.repair_type_id, length_id: item.length_id, width_id: item.width_id, \
            labour_cost: (@customer.hourly_rate_cents * item.mearsk_hours_per_unit)/100, material_cost: item.non_mearsk_material_cost.dollars, total_cost: ((@customer.hourly_rate_cents * item.mearsk_hours_per_unit)/100) + (item.non_mearsk_material_cost_cents)/100, unit_id: item.unit_id, hours: item.mearsk_hours_per_unit}
        end

    end

    def auto_populate_damage_area
        @repair_list_items = @customer_repair_list.customer_repair_list_items.where('container_repair_area_id': params[:container_repair_area_id].to_i)
        throw_error('Item not available', :unprocessable_entity) if @repair_list_items.empty?
        ids = @repair_list_items.pluck(:container_repair_area_id)
        # puts ids
        @container_damaged_areas = ContainerDamagedArea.where(id: ids)
        render json: @container_damaged_areas, each_serializer: MetaSerializer
    end


    def auto_populate_repair_type
        @repair_list_items = @customer_repair_list.customer_repair_list_items.where('container_damaged_area_id': params[:container_damaged_area_id].to_i, 'container_repair_area_id': params[:container_repair_area_id].to_i)
        throw_error('Item not available', :unprocessable_entity) if @repair_list_items.empty?
        ids = @repair_list_items.pluck(:repair_type_id)
        @repair_type = RepairType.where(id: ids)
        render json: @repair_type, each_serializer: MetaSerializer
        # render json: {repair_type_ids: @repair_list_items.pluck(:repair_type_id)}
    end

    def auto_populate_length
        @repair_list_items = @customer_repair_list.customer_repair_list_items.where('container_damaged_area_id': params[:container_damaged_area_id].to_i, 'container_repair_area_id': params[:container_repair_area_id].to_i,'repair_type_id': params[:repair_type_id].to_i)

        throw_error('Item not available', :unprocessable_entity) if @repair_list_items.empty?
        ids = @repair_list_items.pluck(:length_id)

        @length = Length.where(id: ids)
        render json: @length, each_serializer: MetaSerializer
        # render json: {repair_type_ids: @repair_list_items.pluck(:repair_type_id)}
    end

    def auto_populate_width
        @repair_list_items = @customer_repair_list.customer_repair_list_items.where('container_damaged_area_id': params[:container_damaged_area_id].to_i, 'container_repair_area_id': params[:container_repair_area_id].to_i,'repair_type_id': params[:repair_type_id].to_i, 'length_id': params[:length_id].to_i)

        throw_error('Item not available', :unprocessable_entity) if @repair_list_items.empty?
        ids = @repair_list_items.pluck(:width_id)

        @width = Width.where(id: ids)
        render json: @width, each_serializer: MetaSerializer
        # render json: {repair_type_ids: @repair_list_items.pluck(:repair_type_id)}
    end

    def auto_populate_unit
        @repair_list_items = @customer_repair_list.customer_repair_list_items.where('container_damaged_area_id': params[:container_damaged_area_id].to_i, 'container_repair_area_id': params[:container_repair_area_id].to_i,'repair_type_id': params[:repair_type_id].to_i, 'length_id': params[:length_id].to_i, 'width_id': params[:width_id].to_i)

        throw_error('Item not available', :unprocessable_entity) if @repair_list_items.empty?
        ids = @repair_list_items.pluck(:unit_id)

        @unit = Unit.where(id: ids)
        render json: @unit, each_serializer: MetaSerializer
        # render json: {repair_type_ids: @repair_list_items.pluck(:repair_type_id)}
    end

    def auto_populate_all
        # puts @customer_repair_list.as_json
        # puts @customer_repair_list.customer_repair_list_items.count
        puts "controller"
        puts @customer_repair_list.customer_repair_list_items.first.as_json

        @repair_list_items = @customer_repair_list.customer_repair_list_items.where('container_damaged_area_id': params[:container_damaged_area_id].to_i, 'container_repair_area_id': params[:container_repair_area_id].to_i,  'repair_type_id': params[:repair_type_id].to_i, 'length_id': params[:length_id].to_i, 'width_id': params[:width_id].to_i, 'unit_id': params[:unit_id]).first
       
        puts params.as_json
        throw_error('Item not available', :unprocessable_entity) if @repair_list_items.blank?

        uids = @repair_list_items.uid
        hours = @repair_list_items.mearsk_hours_per_unit
        material_cost = @repair_list_items.non_mearsk_material_cost_cents
        item = @repair_list_items
        if @customer.billing_type == 'common' 
            render json: { container_repair_area_id: item.container_repair_area_id, container_damaged_area_id: item.container_damaged_area_id, repair_type_id: item.repair_type_id, length_id: item.length_id, width_id: item.width_id, \
            labour_cost: (@customer.hourly_rate_cents * item.mearsk_hours_per_unit)/100, material_cost: item.non_mearsk_material_cost.dollars, total_cost: ((@customer.hourly_rate_cents * item.mearsk_hours_per_unit)/100) + (item.non_mearsk_material_cost_cents)/100, unit_id: item.unit_id, hours: item.mearsk_hours_per_unit}
        else
            render json: { container_repair_area_id: item.container_repair_area_id, container_damaged_area_id: item.container_damaged_area_id, repair_type_id: item.repair_type_id, length_id: item.length_id, width_id: item.width_id, \
            labour_cost: (@customer.hourly_rate_cents * item.mearsk_hours_per_unit*item.mearsk_units)/100, material_cost: item.mearsk_units * item.mearsk_unit_material_cost_cents, total_cost: ((@customer.hourly_rate_cents * item.mearsk_hours_per_unit)/100) + (item.non_mearsk_material_cost_cents)/100, unit_id: item.unit_id, hours: item.mearsk_hours_per_unit}
        end
    end
    private

    # def auto_populate_params
    #     params.permit(:container_damaged_area_id, :container_repair_area_id, :repair_type_id)
    # end

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

    def set_repair_list
        @activity = Activity.find(params[:activity_id])
        @customer = @activity.container.customer
        @customer_repair_list = CustomerRepairList.where(is_active: true, customer: @customer).first
    end
end