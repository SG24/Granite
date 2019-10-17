class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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

  def user_not_authorized
    flash[:warning] = 'All accessable tasks are listed below.'
    redirect_to root_path
  end
end
