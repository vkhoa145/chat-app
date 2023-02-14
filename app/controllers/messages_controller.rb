class MessagesController < ApplicationController
  
  def index
    @messages = Message.all
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save!
      
      ActionCable.server.broadcast "chat_channel", { message: message_render(@message) }
    end

  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end

  def message_render(message)
    render(partial: 'messages/messages', locals: {message: message})
  end
end
