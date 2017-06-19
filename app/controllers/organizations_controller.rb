class OrganizationsController < ApplicationController
# before_action :authenticate_user!
# ONLY ADMIN

  def index
    @organizations = Organization.all
  end

  def new
  end

  def create
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
