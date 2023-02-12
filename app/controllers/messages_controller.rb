class MessagesController < ApplicationController
  
  def index
    @messages = Message.all
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save!
      
      ActionCable.server.broadcast "chat_channel", { message: @message.content }
    end

  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
