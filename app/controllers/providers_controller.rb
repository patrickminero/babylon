class ProvidersController < ApplicationController
	def index
		@providers = Provider.all

		@markers = @providers.geocoded.map do |provider|
			{
			  lat: provider.latitude,
			  lng: provider.longitude
			}
		end
	end

	def show
		@provider = Provider.find(params[:id])
		@booking = Booking.new
		@review = Review.new
		# @chatroom  = Chatroom.create(provider: @provider, user: current_user)
	end

	def new
		@provider = Provider.new
	end

	def create
		@provider = Provider.new(providers_params)
		@provider.user = current_user
		@provider.user.provider = true
		@provider.user.save!
		if @provider.save!
			redirect_to provider_path(@provider)
		else
			render :new
		end
	end

	def edit
	
	end
	def update
	end

	def destroy
	
	end

	private
	def providers_params
		params.require(:provider).permit(:name, :description, :location, :rate, :service_type, :languages, photos: [])
	end
end
