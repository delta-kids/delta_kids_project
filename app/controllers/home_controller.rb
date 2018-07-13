class HomeController < ApplicationController
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
    if verify_recaptcha
      name = params[:name]
      email = params[:email]
      message = params[:message]
      ContactUsMailer.contact_email(name, email, message).deliver
      redirect_to contact_submit_path, notice: 'Message sent'
    end
  end

  def bootstrap_class_for(flash_type)
    map = {
      "success"         => "alert-success",
      "error"           => "alert-danger",
      "alert"           => "alert-warning",
      "notice"          => "alert-info",
      "recaptcha_error" => "alert-danger"
    }
    map.fetch(flash_type)
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

    @events = apply_scopes(Event, event_params).all
    @programs = apply_scopes(Program, program_params).all
    @services = apply_scopes(Service, service_params).all

    @all_results =
      @events.order(title: :asc) +
        @programs.includes(:organization).order("organizations.name asc") +
        @services.includes(:organization).order("organizations.name asc")

    @map_search_results = Kaminari.paginate_array(@all_results).page(params[:page]).per(5)


    @hash1 = Gmaps4rails.build_markers(@all_results) do |event, marker|
      if event.has_attribute?(:event_type_id)
        concat_event_info = "
      <p class='bree-font26'>#{event.title}</p>
      <br>
      <img src='#{event.image_url.to_s}' class='img-responsive' style='width:100%;height:250px;object-fit: cover'></img>
      <br>
      <p class='font-16'>#{event.description}</p>
      <p class='font-16'>#{event.address}</p>
      <a class='event-info-bold2 font-16' href='events/learn_more/#{event.id}'>Learn More</a>"
        marker.lat event.latitude
        marker.lng event.longitude
        marker.infowindow concat_event_info

      elsif event.has_attribute?(:program_type_id)
        concat_program_info = "
      <p class='bree-font26'>#{event.organization.name}</p>
      <br>
      <img src='#{event.image_url.to_s}' class='img-responsive' style='width:100%;height:250px;object-fit: cover'></img>
      <br>
      <p class='font-16'>#{event.program_description}</p>
      <p class='font-16'>#{event.organization.address}</p>
      <a class='event-info-bold2 font-16' href='programs/learn_more/#{event.id}'>Learn More</a>"

        marker.lat event.organization.latitude
        marker.lng event.organization.longitude
        marker.infowindow concat_program_info
      elsif event.has_attribute?(:service_type_id)
        concat_service_info = "
      <p class='bree-font26'>#{event.organization.name}</p>
      <br>
      <img src='#{event.image_url.to_s}' class='img-responsive' style='width:100%;height:250px;object-fit: cover'></img>
      <br>
      <p class='font-16'>#{event.service_description}</p>
      <p class='font-16'>#{event.organization.address}</p>
      <a class='event-info-bold2 font-16' href='services/learn_more/#{event.id}'>Learn More</a>"
        marker.lat event.organization.latitude
        marker.lng event.organization.longitude
        marker.infowindow concat_service_info
      end
    end

  end

  def search

  end

  def whatsnew

  end

  private

  def event_params
    params.slice(:search, :by_start_date, :by_end_date, :approved, :event_location, :registration, :cost, :age_group, :event_type)
  end

  def program_params
    params.slice(:search, :age_group, :program_type, :cost, :registration)
  end

  def service_params
    params.slice(:search, :category, :service_type)
  end

end
