class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]


  def new
    @event = Event.new
  end


  def create
    @event = Event.new event_params
    if @event.save
      flash[:notice] = 'Event create'
      redirect_to event_path(@event)
    else
      flash.now[:alert] = @event.pretty_errors
      render :new
    end
  end


  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end


  # def edit
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end

  private
  def event_params
    params.require(:event).permit([:title, :start_date, :end_date, :start_time, :event_repeat, :event_location, :address, :cost, :registration, :more_info, :contact_name, :contact_email, :approved, { age_group_ids: [] } ])
  end
  def find_event
    @event = Event.find params[:id]
  end

end
