class AvailabilitiesController < ApplicationController
  
  def index
    render(json: { availabilities: Availability.all })
  end

  def show
    # Input comes in from the `params` hash
    render(json: Availability.find(params[:id]))
  end

  def create
    @availability = Availability.new(availability_params)
    if @availability.save
      render json: {
        status: :created,
        availability: @availability
      }
    else 
      render json: {
        status: 500,
        errors: @availability.errors.full_messages
      }
    end
  end

  def update
    availability = Availability.find(params[:id])
    availability.update(availability_params)
    render(json: { availability: availability })
  end

  def destroy
    availability = Availability.destroy(params[:id])
    render(status: 204)
  end
  
  private
  
  def availability_params
    params.require(:availability).permit(:name, :days)
  end
end
