class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)

  end

  def index
    @users = User.all
  end



  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email) # Sécurité obligatoire : ca vérifie que le paramètre renvoi que des attributs de user
  end

end