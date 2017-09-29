class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  # ALL USERS, including ADMIN

  def index
    @events = Event.all
    @events_by_start_date = @events.group_by(&:start_date)
    @search_count = Event.search(params[:term])
    @events_search = Event.search(params[:term]).page(params[:page]).per(5)
  end

  def index2
    @events = Event.where(:approved => true).order(title: :asc).page(params[:page]).per(25)
    @events_by_start_date = @events.group_by(&:start_date)
  end

  def show
    @event = Event.find(params[:id])
  end

  def learn_more
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    if @event.save
      flash[:notice] = 'Event Created'
      redirect_to event_path(@event)
    else
      flash.now[:alert] = @event.pretty_errors
      render :new
    end
  end

  def update
    @event.update(event_params)
    redirect_to @event, notice: "Successfully Updated"
  end

  def pending_and_approved_events
    @events = Event.where(:approved => false || nil).order(title: :asc).page(params[:page]).per(25)
  end

  def destroy
    if is_admin?
      @event.destroy
      redirect_to events_path, notice: "Organization Deleted!"
    else
      flash[:alert] = "Access Denied"
      redirect_to @event
    end
  end


  private
  def event_params
    params.require(:event).permit([:title, :term, :start_date, :end_date, :start_time, :end_time, :event_repeat, :event_location, :address, :cost, :registration, :more_info, :contact_name, :contact_email, :approved, :description, :image, { age_group_ids: [] } ])
  end
  def find_event
    @event = Event.find params[:id]
  end

end
