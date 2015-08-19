class MessagesController < ApplicationController
  include ActionController::Live

  before_filter :check_session, except: :events

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

  def new_streaming
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

  def events
    response.headers["Content-Type"] = "text/event-stream"
    start = Time.now
    100.times do
      Message.uncached do
        Message.where('created_at > ?', start).each do |msg|
          msg.username = msg.user.name
          msg.save
          response.stream.write "data: #{msg.to_json(:methods => :username)}\n\n"
          start = message.created_at
        end
      end
      sleep 3
    end
  rescue IOError
    logger.info "Stream closed"
  ensure
    response.stream.close
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
