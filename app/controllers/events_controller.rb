class EventsController < ApplicationController
  # ALL USERS, including ADMIN
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  has_scope :by_start_date
  has_scope :by_end_date
  has_scope :search
  has_scope :approved
  has_scope :event_location, :type => :array
  has_scope :registration, :type => :array
  has_scope :cost, :type => :array
  has_scope :event_type, :type => :array
  has_scope :age_group, :type => :array

  def index
    @events = apply_scopes(Event).all
    @events_search = @events.page(params[:page]).per(5)
    @events_by_start_date = @events.group_by(&:start_date)
    @calendar_events = @events.flat_map{ |e| e.calendar_events(
      params.fetch(:by_start_date, Time.zone.now - 3.months ).to_date,
      params.fetch(:by_end_date, Time.zone.now + 3.months).to_date
       ) }
  end

  def index2
    @events = Event.where(:approved => true).order(title: :asc).page(params[:page]).per(25)
    @events_by_start_date = @events.group_by(&:start_date)
    @events_public = Event.where(:user_id => current_user.id ).order(title: :asc).page(params[:page]).per(25)
  end

  def show
    @event = Event.find(params[:id])
  end

  def decline
    @event = Event.find(params[:id])
  end

  def decline_mail
    event = params[:event]
    event_email = params[:event_email]
    message = params[:message]
    PendingEventMailer.decline_email(event,event_email,message).deliver
    redirect_to dashboard_pending_and_approved_events_path, notice: "Decline Email Sent"
  end

  def learn_more
    @event = Event.find(params[:id])
    @featured_events = Event.where(:featured => true).limit(3).order("RANDOM()")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    @event.user_id = current_user.id
    @event.start_date = @event.start_time.strftime("%Y/%m/%d")
    @event.end_date = @event.end_time.strftime("%Y/%m/%d")
    if is_admin?
      @event.approved = true
    end
    if @event.image.present? == false
      @event.image  = File.open(File.join(Rails.root,"app/assets/images/DeltaKids#{rand(4)}.jpg"))
    end
    if @event.save
      if is_admin?
        flash[:notice] = 'Event Created'
        redirect_to event_path(@event)
      else
      flash[:notice] = 'Event Created'
      redirect_to event_path(@event)
      PendingEventMailer.pending_event_notice_email(@event).deliver!
      end
    else
      flash.now[:alert] = @event.pretty_errors
      render :new
    end
  end

  def update
    @event_update = find_event
    if @event_update.image.present? == false
      @event_update.image  = File.open(File.join(Rails.root,"app/assets/images/DeltaKids#{rand(4)}.jpg"))
    end
    @event_update.start_date = @event_update.start_time.strftime("%Y/%m/%d")
    @event_update.end_date = @event_update.end_time.strftime("%Y/%m/%d")
    @event_update.update(event_params)
    redirect_to @event_update, notice: "Successfully Updated"
  end

  def pending_and_approved_events
    @events = Event.where(:approved => false || nil).order(title: :asc).page(params[:page]).per(25)
  end

  def destroy
    if is_admin?
      @event.destroy
      redirect_to dashboard_manage_events_path, notice: "Event Deleted!"
    else
      flash[:alert] = "Access Denied"
      redirect_to @event
    end
  end


  private
  def event_params
    params.require(:event).permit([:title, :term, :start_date, :end_date, :start_time, :end_time, :event_repeat, :event_location, :address, :cost, :registration, :more_info, :contact_name, :contact_email, :approved, :featured, :age_group_id, :event_type_id, :description, :image, :pdf_file, :user_id, :recurring, { age_group_ids: [] },
    { tag_ids: [] }
    ])
  end

  def find_event
    @event = Event.find params[:id]
  end

end
