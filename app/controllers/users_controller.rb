class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        
        @provider = Provider.find_by(user_id: @user.id)
        if @provider.nil? 
            @request = []
        else
            @requests = Booking.count > 0 ? Booking.where(provider_id: @provider.id) : []
        end
        authorize @user
    end

    def bookings
        @bookings = Booking.where(user_id: current_user.id)
    end
end
