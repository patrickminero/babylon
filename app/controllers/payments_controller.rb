class PaymentsController < ApplicationController
    def new
        @booking = current_user.bookings.where(pending: true).find(params[:booking_id])
    end
end
