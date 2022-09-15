class ListingsController < ApplicationController

  def index
    @listings = Listing.all
    render json: @listings.to_json(methods: [:bookings_count, :reservations_count])
  end
  
  def show
    @listing = Listing.find_by_id(params[:id])
    render json: @listing.to_json(methods: [:bookings_count, :reservations_count])
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
