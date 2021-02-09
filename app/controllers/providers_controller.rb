class ProvidersController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :all]
	def index
		@providers = policy_scope(Provider).where(service_type: params[:format])

		@markers = @providers.geocoded.map do |provider|
			{
			  lat: provider.latitude,
			  lng: provider.longitude,
			  infoWindow: render_to_string(partial: "info_window", locals: { provider: provider })
			}
		end
	end

	def all
		@providers = policy_scope(Provider).all

		@markers = @providers.geocoded.map do |provider|
			{
			  lat: provider.latitude,
			  lng: provider.longitude,
			  infoWindow: render_to_string(partial: "info_window", locals: { provider: provider })
			}
		end
	end

	def show
		@provider = Provider.find(params[:id])
		@booking = Booking.new
		@review = Review.new
		authorize @provider
	end

	def new
		@provider = Provider.new
		authorize @provider
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
		authorize @provider
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
