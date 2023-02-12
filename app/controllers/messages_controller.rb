class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    binding.pry 
    @message = Message.new(message_params)
    if @message.valid?
      @message.save!
      ActionCable.server.broadcast "chat_channel", { message: @message.content }
    end
  end

  private

  def message_params
    params.permit(:body)
  end
end
