class EventsController < ApplicationController


  # ALL USERS, including ADMIN

  def index
    @events = Event.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
