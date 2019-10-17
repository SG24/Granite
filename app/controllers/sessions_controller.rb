class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:login][:email].downcase)

    if user&.authenticate(params[:login][:password])
      session[:user_id] = user.id.to_s
      flash[:notice] = 'Successfully logged in!'
      redirect_to root_path
    else
      flash.now[:alert] = 'Incorrect credentials, try again!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged Out!'
    redirect_to login_path
  end
end
