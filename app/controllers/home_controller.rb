class HomeController < ApplicationController
  # before_action :authenticate_user!, only: [:dashboard]

  def index
  end

  def about
  end

  def contact
  end

  def live
  end

  def submit
    @name = params(:name)
  end

  def dashboard
    # render :layout => false
  end

  def surveys
  end


  def map

  end

  def search

  end

  def whatsnew

  end

end
