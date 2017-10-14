class OrganizationsController < ApplicationController
  before_action :authenticate_user!

  # ONLY ADMIN
  before_action :find_organization, only: [:show, :edit, :update, :destroy]


  def new
      @organization = Organization.new
  end

  def create
    @organization = Organization.new organization_params
    if @organization.save
      flash[:notice] = 'Organization Created'
      redirect_to organization_path(@organization)
    else
      flash.now[:alert] = @organization.pretty_errors
      render :new
    end
  end


  def show
    @organization = Organization.find(params[:id])
  end

  def index
    @organizations = Organization.order(name: :asc).page(params[:page]).per(25)
  end


  def edit
      @organization = Organization.find(params[:id])
  end

  def update
    @organization.update(organization_params)
    redirect_to @organization, notice: "Successfully Updated"
  end

  def destroy
    if is_admin?
      @organization.destroy
      redirect_to organizations_path, notice: "Organization Deleted!"
    else
      flash[:alert] = "Access Denied"
      redirect_to @organization
    end
  end

  private
  def organization_params
    params.require(:organization).permit([:name, :description, :address, :phone, :website, :image, { program_type_ids: [] }, { age_group_ids: [] }])
  end
  def find_organization
    @organization = Organization.find params[:id]
  end

end
