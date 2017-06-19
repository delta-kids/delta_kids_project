class OrganizationProgramTypesController < ApplicationController
  # before_action :authenticate_user!
  def create
    organization = Organization.find params[:organization_id]
    activityType = ProgramType.find params[:program_type_id]
    orgActType = OrganizationActivityType.new(organization: organization, program_type: activityType)
    # if is_admin?
    # eslif orgActType.save
    if orgActType.save
       flash[:notice] = 'Activity type created'
       redirect_to dashboard_path
     else
       flash.now[:alert] = orgActType.pretty_errors
       redirect_to new_program_type_path
     end
  end

  def destroy
    orgActType = OrganizationActivityType.find params[:id]
    if orgActType.destroy
      flash[:notice] = 'Activity type deleted'
    else
      flash[:alert] = orgActType.pretty_errors
    end
    redirect_to dashboard_path
  end
  
end
