class BookingsController < ApplicationController
  def show
      @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @provider = Provider.find(params[:provider_id])
    @booking.provider = @provider
    @booking.user = current_user
    if @booking.save
      redirect_to provider_booking_path(@provider, @booking.id)
    else
        redirect_to provider_path(@provider)
    end
    # authorize @booking
  end

  def confirmation
    @booking = Booking.find(params[:id])
    @provider = @booking.provider
    # @match = Match.find(session[:match_id])
    # authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :user, :provider_id)
  end
end