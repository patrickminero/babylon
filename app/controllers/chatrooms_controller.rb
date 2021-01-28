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
    def index
        @provider = Provider.find_by(user_id: current_user.id)
        @provider_chats = Chatroom.where(user_id: current_user.id)
        @user_chats = current_user.provider ?  Chatroom.where(provider_id: @provider.id) : []
    end

    def show
        @chatroom = Chatroom.find(params[:id])
        @message = Message.new
    end
end
