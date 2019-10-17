class ApplicationController < ActionController::Base
  private

  def ensure_user_logged_in
    return if logged_in?

    flash[:danger] = 'Please Log In to view the Tasks.'
    redirect_to login_path
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
