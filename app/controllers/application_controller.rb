class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user

  def current_user
    return nil unless session[:session_token]
    @blargh ||= User.find_by(session_token: session[:session_token])
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    redirect_to cats_url
  end

  def log_out
  end

  def require_signed_out
    if current_user
      flash[:errors] = ["Already Signed In!!!!"]
      redirect_to cats_url
    end
  end

end
