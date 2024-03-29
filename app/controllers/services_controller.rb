
class ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :update, :destroy]

  # ONLY ADMIN
  def index
    @services = Service.includes(:organization).order("organizations.name asc").page(params[:page]).per(25)
  end

  def show
    @service = Service.find(params[:id])
  end

  def pregnancy_babies
    @whats_new_items_random = WhatsNewItem.all.limit(3).order("RANDOM()")
    @services = Service.includes(:organization).order("organizations.name asc").all.where(:category_id => '3')
    @help_crisis = @services.where("service_type_id = '8'").page(params[:page]).per(8)
    @baby_health = @services.where("service_type_id = '3'").page(params[:page]).per(8)
    @support = @services.where("service_type_id = '8'").page(params[:page]).per(8)
    @load_service = Kaminari.paginate_array(@services).page(params[:page]).per(8)

    url = request.path_info
    if url.include?('pregnancy_babies/help_crisis')
      @load_service = @help_crisis
    elsif url.include?('pregnancy_babies/health')
      @load_service = @baby_health
    elsif url.include?('pregnancy_babies/support')
      @load_service = @support
    end
  end


  def children
    @whats_new_items_random = WhatsNewItem.all.limit(3).order("RANDOM()")
    @services = Service.includes(:organization).order("organizations.name asc").all.where(:category_id => '1')
    @help_crisis = @services.where("service_type_id = '4'").page(params[:page]).per(8)
    @child_advocacy = @services.where("service_type_id = '1'").page(params[:page]).per(8)
    @health_development = @services.where("service_type_id = '3'").page(params[:page]).per(8)
    @support = @services.where("service_type_id = '5'").page(params[:page]).per(8)
    @load_service = Kaminari.paginate_array(@services).page(params[:page]).per(8)

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
    @whats_new_items_random = WhatsNewItem.all.limit(3).order("RANDOM()")
    @services = Service.includes(:organization).order("organizations.name asc").all.where(:category_id => '2')
    @help_crisis = @services.where("service_type_id = '4'").page(params[:page]).per(8)
    @child_preschool = @services.where("service_type_id = '7'").page(params[:page]).per(8)
    @assistance = @services.where("service_type_id = '6'").page(params[:page]).per(8)
    @support = @services.where("service_type_id = '8'").page(params[:page]).per(8)
    @meals = @services.where("service_type_id = '9'").page(params[:page]).per(8)
    @load_service = Kaminari.paginate_array(@services).page(params[:page]).per(8)

    url = request.path_info
    if url.include?('families/help_crisis')
      @load_service = @help_crisis
    elsif url.include?('services/families/childcare')
      @load_service = @child_preschool
    elsif url.include?('families/assistance')
      @load_service = @assistance
    elsif url.include?('families/support')
      @load_service = @support
    elsif url.include?('families/meals')
      @load_service = @meals
    end
  end

  def new
      @service = Service.new
  end

  def create
    @service = Service.new service_params
    if @service.save
      flash[:notice] = 'Organization Created'
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

  def learn_more
    @service = Service.find(params[:id])
    @similar_services =  Service.where(service_type_id: @service.service_type_id).limit(3).order("RANDOM()")
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
    params.require(:service).permit([:service_description, :category_id, :service_type_id, :organization_id, :image])
  end

  def find_service
    @service = Service.find params[:id]
  end
end
