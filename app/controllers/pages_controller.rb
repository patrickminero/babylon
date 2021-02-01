class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:home, :categories]
    def home
    end

    def categories
        @categories = []
        
        Provider.all.each do |provider|
            @categories << provider.service_type
        end
    end
end
