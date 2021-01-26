class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @provider = Provider.find_by(user_id: @user.id)
        @requests = Booking.where(provider_id: @provider.id)
    end
end
