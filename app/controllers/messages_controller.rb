class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      render json: { success: true }
    end
  end


  def message_params
    params.require(:message).permit(:text, :user_id)
  end

end
