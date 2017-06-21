class OrganizationsController < ApplicationController
# before_action :authenticate_user!
# ONLY ADMIN
  before_action :find_organization, only: [:show, :edit, :update, :destroy]


  def new
    @organization = Organization.new
  end


  def create
    @organization = Organization.new organization_params
    if @organization.save
      flash[:notice] = 'Organization create'
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
    @organizations = Organization.all
  end


  def edit
  end

  def update
  end

  def destroy
  end

  private
  def organization_params
    params.require(:organization).permit([:name, :description, :address, :phone, :website, { program_type_ids: [] }, { age_group_ids: [] }])
  end
  def find_organization
    @organization = Organization.find params[:id]
  end

end
