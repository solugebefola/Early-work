class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :owned_by_user?


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

  def owned_by_user
    if current_user.cats.where(id: params[:id]).empty?
      flash[:errors] = ["Cat not owned by user"]
      redirect_to cats_url
    end
  end

  def owned_by_user?
    !current_user.cats.where(id: params[:id]).empty?
  end
end
