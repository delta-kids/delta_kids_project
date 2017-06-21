class ProgramTypesController < ApplicationController
  def new
    if is_admin?
      @activityType = ProgramType.new
    else
      redirect_to login_path, notice: 'You are not authorized'
    end
  end

  def create
    @activityType = ProgramType.new activityType_params
    if @activityType.save
      redirect_to home_path
    else
      render :new
    end
  end

  private

  def activityType_params
    params.require(:program_type).permit(:name)
  end

end
