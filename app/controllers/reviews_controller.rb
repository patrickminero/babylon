class ReviewsController < ApplicationController

    def create
        @review = Review.new(review_params)
        @review.user = current_user
        @provider = Provider.find(params[:provider_id])
        @review.provider_id = @provider.id
        if @review.save!
            redirect_to provider_path(@provider)
        else

        end

    end

    private

    def review_params
        params.require(:review).permit(:rating, :content)
    end
end
