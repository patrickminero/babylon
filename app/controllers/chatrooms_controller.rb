class ChatroomsController < ApplicationController
    def show
        @provider = Provider.find(params[:provider_id])
        @chatroom = Chatroom.find(params[:id])
        @message = Message.new
    end
end
