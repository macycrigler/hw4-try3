class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    if @current_user
      @entries = Entry.where(user_id: @current_user.id, place_id: @place.id)
    else
      redirect_to login_path, notice: "You must log in to view this page."
    end
  end
  
  def new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path, notice: "Place was successfully created."
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end
