class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if verify_recaptcha
      if @user.save
        session[:user_id] = @user.id
        UserMailer.welcome_email(@user).deliver!
        redirect_to login_path, notice: "Thank you for signing up"
      else
        render :new
      end
    else
      flash.now[:alert] = "Please complete the Captacha to create an account."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit([:first_name, :last_name, :email, :phone, :password, :password_confirmation])
  end

end
