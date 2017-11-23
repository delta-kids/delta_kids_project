class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def user_signed_in?
    if cookies[:auth_token].present? && current_user.nil?
      cookies[:auth_token] = nil
    end
    cookies[:auth_token].present?
  end

  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.where("auth_token =?", cookies[:auth_token]).first if cookies[:auth_token]
  end

  helper_method :current_user

  def authenticate_user!
    if !user_signed_in?
      redirect_to login_path, notice: 'Please sign in'
    end
  end

  def is_admin?
    if user_signed_in?
      current_user.is_admin
    else
      false
    end
  end
  helper_method :is_admin?

end
