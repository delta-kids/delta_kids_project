class HomeController < ApplicationController
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

end
