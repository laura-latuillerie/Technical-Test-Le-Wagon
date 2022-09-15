class Booking < ApplicationRecord
  belongs_to :listing
  after_create_commit :create_missions

  private

  def create_missions
    check_in_mission = Mission.new(listing_id: self.listing_id, mission_type: 'first_check_in', date: self.start_date, price: self.listing.num_rooms * 10 )
    check_in_mission.save!
    last_checkout_mission = Mission.new(listing_id: self.listing_id, mission_type: 'last_check_out', date: self.end_date, price: self.listing.num_rooms * 10 )
    last_checkout_mission.save!
  end
end
