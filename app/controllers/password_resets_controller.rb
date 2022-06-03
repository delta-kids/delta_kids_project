class PasswordResetsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    unless user.present?
      redirect_to new_password_reset_path, :alert => "Sorry, no user exists with that email."
    else
      user.send_password_reset
      redirect_to home_path, :notice => "Email sent with password reset instructions."
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(user_params)
      redirect_to dashboard_path, :notice => "Password has been reset!"
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit([:first_name, :last_name, :email, :phone, :password, :password_confirmation])
  end

end
