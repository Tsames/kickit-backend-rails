class EventsController < ApplicationController

  def index
    render(json: { events: Event.all })
  end

  def show
    # Input comes in from the `params` hash
    render(json: Event.find(params[:id]))
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: {
        status: :created,
        event: @event
      }
    else 
      render json: {
        status: 500,
        errors: @event.errors.full_messages
      }
    end
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    render(json: { event: event })
  end

  def destroy
    event = Event.destroy(params[:id])
    render(status: 204)
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :location, :description, :start_year, :start_month, :start_day, :end_year, :end_month, :end_day)
  end
end
