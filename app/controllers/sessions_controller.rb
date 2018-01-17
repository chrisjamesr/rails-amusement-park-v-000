class SessionsController < ApplicationController
  before_action :current_user, :only => [:show] 
  def new
  end

  def create
    # user =     
  end

  def destroy

  end
end
