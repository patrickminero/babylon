class ProvidersController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :all]
	before_action :get_location, only: [:index, :all]
	def index
		@providers = policy_scope(Provider).where(service_type: params[:format]).near([session[:latitude], session[:longitude]], 600)
		@markers = @providers.geocoded.map do |provider|
			{
			  lat: provider.latitude,
			  lng: provider.longitude,
			  infoWindow: render_to_string(partial: "info_window", locals: { provider: provider })
			}
		end
	end

	def all
		@providers = policy_scope(Provider).all.near([session[:latitude], session[:longitude]], 600)
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

	def get_location
		if params[:latitude].present? && params[:longitude].present?
			session[:latitude] = params[:latitude]
			session[:longitude] = params[:longitude]
		end
	
		if params[:location].present?
			results = Geocoder.search(params[:location])
			results.first.coordinates
		
			session[:latitude] = results.first.coordinates.first
			session[:longitude] = results.first.coordinates.last
		end

		if params[:query].present?
			@providers = policy_scope(Provider).global_search(params[:query])
		elsif params[:service_type].present?
			@providers = policy_scope(Provider).where(service_type: params[:service_type])
		else
			@providers = policy_scope(Provider)
		end
	end

	def providers_params
		params.require(:provider).permit(:name, :description, :location, :rate, :service_type, :languages, photos: [])
	end
end
