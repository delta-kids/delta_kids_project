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
      @resources = Resource.all
    end


    # def edit
    # end
    #
    # def update
    # end
    #
    # def destroy
    # end

    private
    def resource_params
      params.require(:resource).permit([:title, :feature, :feature_start_date, :feature_end_date, :feature_start_time, :feature_end_time, :resource_location, :description, :contact_name, :contact_email, :created_at, :updated_at, :approved, { topic_ids: [] } ])
    end
    def find_resource
      @resource = Resource.find params[:id]
    end



end
