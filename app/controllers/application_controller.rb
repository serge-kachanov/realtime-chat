class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def default_serializer_options
    { root: false }
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_session
    if current_user == nil
      redirect_to new_session_path, :notice => 'You need to log in to start chatting'
    else
    end
  end


end
