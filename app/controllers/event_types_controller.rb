class EventTypesController < ApplicationController
    def new
      if is_admin?
        @newEventType = EventType.new
      else
        redirect_to login_path, notice: 'You are not authorized'
      end
    end

    def create
      @newEventType = EventType.new eventType_params
      if @newEventType.save
        redirect_to home_path
      else
        render :new
      end
    end

    private

    def eventType_params
      params.require(:event_type).permit(:name)
    end

end
