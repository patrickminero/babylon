class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).where(user_id: current_user.id)
    provider = Provider.find_by(user_id: current_user.id)
    @requests = Booking.count > 0 ? Booking.where(provider_id: provider.id) : []
    
    authorize @bookings
  end

  def new
    @booking = Booking.new
    @provider = Provider.find(params[:provider_id])
  end
  def show
    @booking = current_user.bookings.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @provider = Provider.find(params[:provider_id])
    @booking.provider = @provider
    @booking.user = current_user
    @booking.save!
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @booking.provider.name,
        amount: @booking.provider.rate.to_i * 100,
        currency: 'eur',
        quantity: 1
      }],
      success_url:  provider_booking_confirmation_url(@provider, @booking),
      cancel_url: provider_url(@booking.provider)
    )
    
    @booking.update(checkout_session_id: session.id)
    redirect_to new_provider_booking_payment_path(@provider, @booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @user = User.find(@booking.user_id)
    @booking.destroy
    redirect_to profile_path(@user)
  end

  def confirmation
    @booking = Booking.find(params[:id])
    @booking.pending = false
    @booking.save!
    redirect_to provider_bookings_path(@booking.provider)
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :user, :provider_id, :comments)
  end
end