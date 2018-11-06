class SessionsController < ApplicationController

  def new
  end

  def create

    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Login Completed"
      redirect_to users_path

    else
      flash.now[:danger] = 'Invalid'
      redirect_to home_path
    end
  end
end
