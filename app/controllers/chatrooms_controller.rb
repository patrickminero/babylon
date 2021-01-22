class ChatroomsController < ApplicationController
    def new
        create
    end
    def create
        @user = current_user
        @provider = Provider.find(params[:format])
        @chatroom = Chatroom.find_by(user: @user, provider: @provider)
        if @chatroom
            redirect_to chatroom_path(@chatroom)
        else
            @chatroom = Chatroom.create!(user: @user, provider: @provider)
            redirect_to chatroom_path(@chatroom)
        end
    end

    def show
        @chatroom = Chatroom.find(params[:id])
        @message = Message.new
    end
end
