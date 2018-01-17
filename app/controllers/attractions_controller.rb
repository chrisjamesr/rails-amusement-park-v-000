class AttractionsController < ApplicationController
  before_action :authentication_redirect, :only => [:index]
  
  def index
    @attractions = Attraction.all
  end

end
