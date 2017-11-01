class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def user_signed_in?
    if session[:user_id].present? && current_user.nil?
      session[:user_id] = nil
    end
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # debugger
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
