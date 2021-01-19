class ProvidersController < ApplicationController
	def index
		@providers = Provider.all
	end

	def show
		@provider = Provider.find(params[:id])
		@booking = Booking.new
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
		params.require(:provider).permit(:name, :description, :location, :rate, :languages_spoken, :service_type, photos: [])
	end
end
