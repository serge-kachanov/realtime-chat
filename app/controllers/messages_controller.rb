class MessagesController < ApplicationController

  before_filter :check_session

  def index
    @messages = Message.where("created_at > ?", 3.seconds.ago)
    render json: @messages
  end

  def new_websockets
      @message = Message.new
  end

  def new_shortpoll
      @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      WebsocketRails[:messages].trigger('new', message)
      render json: { success: true }
    end
  end

  def message
    {
      text: @message.text,
      user: @message.user.name,
    }
  end

  def message_params
    params.require(:message).permit(:text)
  end

end
