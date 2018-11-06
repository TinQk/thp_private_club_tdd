class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if @user.save
      log_in @user
      redirect_to home_path
    else
      flash[:danger] = "essai encore"
      redirect_to new_user_path
  end

  def index
    @users = User.all
  end



  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password) # Sécurité obligatoire : ca vérifie que le paramètre renvoi que des attributs de user
  end

end
