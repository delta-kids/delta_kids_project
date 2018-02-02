class ResourcesController < ApplicationController
    before_action :find_resource, only: [:show, :edit, :update, :destroy]

    # has_scope :by_date, :using => [:start_date, :end_date], :type => :hash
    has_scope :approved
    has_scope :resource_location, type: :array
    has_scope :resource_topic, type: :array
    has_scope :resource_age_group, type: :array
    has_scope :resource_type, type: :array


    def new
      @resource = Resource.new
    end


    def create
      @resource = Resource.new resource_params
      if is_admin?
        @resource.approved = true
      end
      @resource.user_id = current_user.id
      if @resource.save
        flash[:notice] = 'Resource Created'
        redirect_to resource_path(@resource)
      else
        flash.now[:alert] = @resource.pretty_errors
        render :new
      end
    end


    def show
      @resource = Resource.find(params[:id])
    end

    def decline
      @resource = Resource.find(params[:id])
    end

    def decline_mail
      resource = params[:resource]
      resource_email = params[:resource_email]
      message = params[:message]
      PendingEventMailer.decline_email(resource,resource_email,message).deliver
      redirect_to dashboard_pending_and_approved_resources_path, notice: "Decline Email Sent"
    end


    def index
      @featured = Resource.where(:feature => true)
      @resources = apply_scopes(Resource).all
      @resources_search = @resources.search(params[:term]).page(params[:page]).per(5)
    end

    def index2
      @resources = Resource.where(:approved => true).order(resource_name: :asc).page(params[:page]).per(25)
      @resources_public = Resource.where(:user_id => current_user.id ).order(resource_name: :asc).page(params[:page]).per(25)
    end

    def edit
      @resource = Resource.find(params[:id])
    end

    def update
      @resource.update(resource_params)
      redirect_to @resource, notice: "Successfully Updated"
    end

    def pending_and_approved_resources
      @resources = Resource.where(:approved => false || nil).order(resource_name: :asc).page(params[:page]).per(25)
    end

    def destroy
      if is_admin?
        @resource.destroy
        redirect_to dashboard_manage_resources_path, notice: "Resource Deleted!"
      else
        flash[:alert] = "Access Denied"
        redirect_to @resource
      end
    end

    private

    def resource_params
      params.require(:resource).permit([:resource_name, :feature, :feature_start_date, :feature_end_date, :feature_start_time, :feature_end_time, :resource_location, :description, :contact_name, :contact_email, :created_at, :updated_at, :approved, :published_date, :term, :user_id, :resource_file, { topic_ids: [] }, { tag_ids: [] }, { age_group_ids: [] } ])
    end

    def find_resource
      @resource = Resource.find params[:id]
    end



end
