class ProgramTypesController < ApplicationController
  def new
    @activityType = ProgramType.new
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
