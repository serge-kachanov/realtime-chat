class MessagesController < ApplicationController

  def new
    if current_user == nil
      redirect_to new_session_path, :notice => 'You need to log in to start chatting'
    else
      @message = Message.new
    end
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
