class EventsController < ApplicationController
  # ALL USERS, including ADMIN
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  helper_method :recurring_to_words

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
    @events = apply_scopes(Event.approved).all
    @events_search = @events.page(params[:page]).per(5)
    @calendar_events = @events.flat_map { |e| e.calendar_events(
      params.fetch(:by_start_date, Time.zone.now - 1.month).to_date,
      params.fetch(:by_end_date, Time.zone.now + 2.month).to_date
    ) }.sort_by { |e| e.start_time.strftime('%H:%M') }

    params[:start_date] ||= params.fetch(:by_start_date, Time.zone.now).to_date # used to set the current month the calendar is on
  end


  def index2
    @events = Event.approved.where("end_date > ?", Time.zone.now - 2.days).where(featured: [false, nil]).order(title: :asc, end_date: :asc)
    @events_results = @events.page(params[:page]).per(10)
    @old_events = Event.where("end_date < ?", Time.zone.now - 2.days).order(title: :asc)
    @featured_events = Event.where(:featured => true).order(title: :asc)
    @events_public = Event.where(:user_id => current_user.id).order(title: :asc).page(params[:page]).per(10)
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
    PendingEventMailer.decline_email(event, event_email, message).deliver
    redirect_to dashboard_pending_and_approved_events_path, notice: "Decline Email Sent"
  end

  def learn_more
    @event = Event.find(params[:id])
    @featured_events = Event.where(:featured => true).limit(3).order("RANDOM()")
  end

  def recurring_to_words
    find_event
    if @event.recurring != {}
      rule = IceCube::Rule.from_hash @event.recurring
      return rule.to_s
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    @event.user_id = current_user.id
    if is_admin?
      @event.approved = true
    end
    if @event.image.present? == false
      @event.image = File.open(File.join(Rails.root, "app/assets/images/DeltaKids#{rand(4)}.jpg"))
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
      @event_update.image = File.open(File.join(Rails.root, "app/assets/images/DeltaKids#{rand(4)}.jpg"))
    end
    @event_update.update(event_params)
    set_status
    redirect_to @event_update, notice: "Successfully Updated"
  end

  def admin_approve_event
    @event = find_event
    @event.update_attribute(:approved, true)
    redirect_to dashboard_pending_and_approved_events_path, notice: "Event Approved!"
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

  helper_method :find_calender_event

  def find_calender_event(event)
    @calendar_event = Event.find(event.id)
  end

  private

  def event_params
    params
      .require(:event)
      .permit(
        [
          :title,
          :term,
          :start_date,
          :end_date,
          :start_time,
          :end_time,
          :event_repeat,
          :address,
          :cost,
          :registration,
          :more_info,
          :contact_name,
          :contact_email,
          :approved,
          :featured,
          :age_group_id,
          :event_type_id,
          :description,
          :image,
          :pdf_file,
          :user_id,
          :recurring,
          { age_group_ids: [] },
          { tag_ids: [] },
          { location_ids: [] }
        ]
      )
  end

  def find_event
    @event = Event.find params[:id]
  end

  def set_status
    if !is_admin? && @event&.approved == true
      @event.approved = nil
      @event.save
    end
  end
end
