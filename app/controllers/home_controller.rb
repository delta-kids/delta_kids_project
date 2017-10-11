class HomeController < ApplicationController
  # before_action :authenticate_user!, only: [:dashboard]

  has_scope :by_date, :using => [:start_date, :end_date], :type => :hash
  has_scope :event_location, :type => :array
  has_scope :registration, :type => :array
  has_scope :cost, :type => :array
  has_scope :age_groups, :type => :array
  has_scope :program_types, :type => :array

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
    @events = apply_scopes(Event).all
    @map_events = @events.search(params[:term])
    @hash = Gmaps4rails.build_markers(@map_events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow event.title
    end
  end

  def search

  end

  def whatsnew

  end

end
