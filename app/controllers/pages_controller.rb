class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:home, :categories]
    def home
    end

    def categories
    end
end
