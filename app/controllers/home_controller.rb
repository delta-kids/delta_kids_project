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
    @whats_new_items_random = WhatsNewItem.all.limit(3).order("RANDOM()")
  end

  def about
  end

  def contact_mail
    name = params[:name]
    email = params[:email]
    message = params[:message]
    ContactUsMailer.contact_email(name, email, message).deliver
    redirect_to contact_submit_path, notice: 'Message sent'
  end


  def live
  end

  def submit

  end

  def dashboard
    @pending_and_approved_events = Event.where(:approved => false || nil)
    @pending_and_approved_resources = Resource.where(:approved => false || nil)
  end

  def surveys

  end

  def map

    @events = apply_scopes(Event, params.slice(event_params)).all
    @programs = apply_scopes(Program, params.slice(program_params)).all
    @services = apply_scopes(Service, params.slice(service_params)).all

    @all_results = @events + @programs + @services

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
    params.slice(:by_start_date, :by_end_date,:search,:approved, :event_location, :registration,:cost,:age_group,:event_type)
  end

  def program_params
    params.slice(:age_group,:search, :program_type, :cost)
  end

  def service_params
    params.slice(:category,:search, :service_type)
  end

end
