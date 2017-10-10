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
    @pending_and_approved_events = Event.where(:approved => false || nil)
    @pending_and_approved_resources = Resource.where(:approved => false || nil)
  end

  def surveys
  end

  def map
    @map_events = Event.search(params[:term])
    @hash = Gmaps4rails.build_markers(@map_events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow event.address
    end
  end

  def search

  end

  def whatsnew

  end

end
