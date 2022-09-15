class ListingsController < ApplicationController

  def index
    @listings = Listing.all
    render json: @listings
  end
  
  def show
    @listing = Listing.find_by_id(params[:id])
    render json: @listing
  end

  def create
    @listing = Listing.create(listing_params)
    render json: @listing
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    render json: @listing
  end

  def destroy
    Listing.destroy(params[:id])
  end

  private

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end
end
