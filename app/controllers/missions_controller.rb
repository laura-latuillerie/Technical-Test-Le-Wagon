class MissionsController < ApplicationController
  
  def index
    @missions = Mission.all
    render json: @missions, only: [:listing_id, :mission_type, :date, :price]
  end
end
