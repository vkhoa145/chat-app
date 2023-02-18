class HomeController < ApplicationController
  def index
    @messages = Message.all
    @messages.each do |message|
      filter_user(message)
    end
  end

  private

  def filter_user(message)
    if message.user.id == current_user.id
      return @class = 'sender'
    else
      return @class = 'recipient'
    end
  end
end
