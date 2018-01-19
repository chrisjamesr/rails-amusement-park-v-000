class AttractionsController < ApplicationController
  before_action :authentication_redirect, :only => [:index, :show]
  before_action :current_user, :only => [:show]
  def index
    @attractions = Attraction.all
  end

  def show

    @attraction = Attraction.find(params[:id])
  end

end
