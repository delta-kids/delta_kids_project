class ResourcesController < ApplicationController
    before_action :find_resource, only: [:show, :edit, :update, :destroy]


    def new
      @resource = Resource.new
    end


    def create
      @resource = Resource.new resource_params
      if @resource.save
        flash[:notice] = 'Resource create'
        redirect_to resource_path(@resource)
      else
        flash.now[:alert] = @resource.pretty_errors
        render :new
      end
    end


    def show
      @resource = Resource.find(params[:id])
    end

    def index
      @featured = Resource.where(:feature => true)
      @resources = Resource.all.order(name: :asc).page(params[:page]).per(5)
    end

    def index2
      @resources = Resource.where(:approved => true).order(name: :asc).page(params[:page]).per(25)
    end

    def edit
      @resource = Resource.find(params[:id])
    end

    def update
      @resource.update(resource_params)
      redirect_to @resource, notice: "Successfully Updated"
    end

    def pending_and_approved_resources
      @resources = Resource.where(:approved => false || nil).order(name: :asc).page(params[:page]).per(25)
    end

    def destroy
      if is_admin?
        @resource.destroy
        redirect_to resources_path, notice: "Resource Deleted!"
      else
        flash[:alert] = "Access Denied"
        redirect_to @resource
      end
    end

    private
    def resource_params
      params.require(:resource).permit([:name, :feature, :feature_start_date, :feature_end_date, :feature_start_time, :feature_end_time, :resource_location, :description, :contact_name, :contact_email, :created_at, :updated_at, :approved, :published_date, :resource_file, { topic_ids: [] } ])
    end
    def find_resource
      @resource = Resource.find params[:id]
    end



end
