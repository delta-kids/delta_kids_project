class ServicesController < ApplicationController

  # ONLY ADMIN
  def index
    @services = Service.all
  end

  def show
      @service = Service.find(params[:id])
  end

  def pregnancy_babies
    @services = Service.all.where(:category_id => '3')
    @help_crisis = @services.where("service_type_id = '4'")
    @baby_health = @services.where("service_type_id = '3'")
    @support = @services.where("service_type_id = '8'")
    @load_service = @services

    url = request.path_info
    if url.include?('pregnancy_babies/help_crisis')
      @load_service = @help_crisis
    elsif url.include?('pregnancy_babies/support')
      @load_service = @baby_health
    elsif url.include?('pregnancy_babies/support')
      @load_service = @support
    end
  end


  def children
    @services = Service.all.where(:category_id => '1')
    @help_crisis = @services.where("service_type_id = '4'")
    @child_advocacy = @services.where("service_type_id = '1'")
    @health_development = @services.where("service_type_id = '3'")
    @support = @services.where("service_type_id = '5'")
    @load_service = @services

    url = request.path_info
    if url.include?('children/help_crisis')
      @load_service = @help_crisis
    elsif url.include?('children/child_advocacy')
      @load_service = @child_advocacy
    elsif url.include?('children/health')
      @load_service = @health_development
    elsif url.include?('children/support')
      @load_service = @support
    end
  end

  def families
    @services = Service.all.where(:category_id => '2')
    @help_crisis = @services.where("service_type_id = '4'")
    @child_preschool = @services.where("service_type_id = '7'")
    @assistance = @services.where("service_type_id = '6'")
    @support = @services.where("service_type_id = '5'")
    @load_service = @services

    url = request.path_info
    if url.include?('families/help_crisis')
      @load_service = @help_crisis
    elsif url.include?('families/childcare')
      @load_service = @child_advocacy
    elsif url.include?('families/assistance')
      @load_service = @health_development
    elsif url.include?('families/support')
      @load_service = @support
    end
  end

  def new
      @service = Service.new
  end

  def create
    @service = Service.new service_params
    if @service.save
      flash[:notice] = 'Organization create'
      redirect_to service_path(@service)
    else
      flash.now[:alert] = @service.pretty_errors
      render :new
    end
  end

  def edit
      @service = Service.find(params[:id])
  end

  def update
    @service.update(service_params)
    redirect_to @service, notice: "Successfully Updated"
  end

  def destroy
    if is_admin?
      @service.destroy
      redirect_to services_path, notice: "Service Deleted!"
    else
      flash[:alert] = "Access Denied"
      redirect_to @service
    end
  end

private
  def service_params
    params.require(:service).permit([:description, { service_type_ids: [] }, { organization_id: [] }, { category_id: [] }])
  end

  def find_service
    @service = Service.find params[:id]
  end

end
