class AttractionsController < ApplicationController
  before_action :authentication_redirect, :only => [:index, :show]
  before_action :current_user, :only => [:show]
  before_action :admin_redirect, :only => [:new, :create, :edit, :update, :destroy]
  before_action :find_attraction, :only => [:new, :show, :edit, :update, :destroy]

  def new
    @attraction = Attraction.new
    @action = "Create"
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction.save
      redirect_to attraction_path(attraction)
    else
      flash[:errors] = attraction.errors.full_messages
      render :new
    end
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    # @attraction = Attraction.find(params[:id]) || Attraction.new
    @action = "Update"

  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      flash[:notice] = @attraction.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

    def find_attraction
      @attraction = Attraction.find_by(:id => params[:id]) || Attraction.new
      
    end
end
