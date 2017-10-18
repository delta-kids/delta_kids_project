class HomeController < ApplicationController
  # before_action :authenticate_user!, only: [:dashboard]

  has_scope :by_start_date
  has_scope :by_end_date
  has_scope :search
  has_scope :approved
  has_scope :event_location, type: :array
  has_scope :registration, type: :array
  has_scope :cost, type: :array
  has_scope :age_group, type: :array
  has_scope :program_type, type: :array
  has_scope :event_type, type: :array
  has_scope :category, type: :array
  has_scope :service_type, type: :array

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

    @events = apply_scopes(Event, params.slice(:by_start_date, :by_end_date,:search,:approved, :event_location, :registration,:cost,:age_group,:event_type)).all
    @programs = apply_scopes(Program, params.slice(:age_group,:search, :program_type, :cost)).all
    @services = apply_scopes(Service, params.slice(:category,:search, :service_type)).all

    @all_results = @programs + @events + @services

    if @all_results.kind_of?(Array)
      @map_search_results = Kaminari.paginate_array(@all_results).page(params[:page]).per(5)
    else
      @all_results.kind_of?(Array)
        @map_search_results = @all_results.page(params[:page]).per(5)
    end


    @hash1 = Gmaps4rails.build_markers(@all_results) do |event, marker|
      if event.has_attribute?(:event_type_id)
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow event.title
    elsif event.has_attribute?(:program_type_id)
      marker.lat event.organization.latitude
      marker.lng event.organization.longitude
      marker.infowindow event.description
    elsif event.has_attribute?(:service_type_id)
      marker.lat event.organization.latitude
      marker.lng event.organization.longitude
      marker.infowindow event.description
    end
  end

  end

  def search

  end

  def whatsnew

  end

private

  def event_params
    params.slice(:by_start_date, :by_end_date, :event_location, :registration,:cost,:age_group,:program_type)
  end

  def program_params
    params.slice(:age_group, :program_type)
  end

  def service_params
    params.slice(:category, :service_type)
  end

end
