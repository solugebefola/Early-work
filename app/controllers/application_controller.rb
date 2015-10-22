class ApplicationController < ActionController::Base
  helper_method :signed_in?, :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sign_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def sign_out!(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
    return nil if session[:session_token].nil?
    @blarghe ||= User.find_by(session_token: session[:session_token])
  end

  def signed_in?
    !current_user.nil?
  end

  def require_signed_in
    redirect_to new_session_url unless signed_in?
  end
end
