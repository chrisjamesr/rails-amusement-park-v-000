class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    user = User.new(user_params)
    raise user.inspect
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end
end
