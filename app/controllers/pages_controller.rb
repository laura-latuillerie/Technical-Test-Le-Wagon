class PagesController < ApplicationController

  def api_listings_index
    @listings = Listing.all
    render json: @listings.to_json
  end

  def api_listings_show
    @listing = Listing.find_by_id(params[:id])
    render json: @listing.to_json
  end

  def home
  end
end
