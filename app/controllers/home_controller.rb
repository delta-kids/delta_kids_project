class HomeController < ApplicationController
  # before_action :authenticate_user!, only: [:dashboard]

  has_scope :by_start_date
  has_scope :by_end_date
  has_scope :event_location, :type => :array
  has_scope :registration, :type => :array
  has_scope :cost, :type => :array
  has_scope :age_group, :type => :array
  has_scope :program_type, :type => :array
  has_scope :category, :type => :array
  has_scope :service_type, :type => :array

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
    @programs = apply_scopes(Program).all
    @services = apply_scopes(Service).all
    @event_results = @events.search(params[:term])
    @map_search_results = @event_results.page(params[:page]).per(5)

    @hash1 = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow event.title
    end
    @hash2 = Gmaps4rails.build_markers(@programs) do |program, marker|
      marker.lat program.organization.latitude
      marker.lng program.organization.longitude
      marker.infowindow program.description
    end
    @hash3 = Gmaps4rails.build_markers(@services) do |service, marker|
      marker.lat service.organization.latitude
      marker.lng service.organization.longitude
      marker.infowindow service.description
    end

  end

  def search

  end

  def whatsnew

  end

end
