class SessionsController < ApplicationController
  before_action :current_user, :only => [:show] 
  def new
  end

  def create
    raise params.inspect
    if @user = User.find_by(:name => params[:user][:name])    
      if @user && user.authenticate(params[:user][:password])
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
      else
        render :new
      end
    else
      redirect_to new_user_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = "You have been logged out!"
    render :new

  end
end
