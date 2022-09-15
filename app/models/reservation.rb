class Reservation < ApplicationRecord
  belongs_to :listing
  after_create_commit :create_checkout_checkin_mission

  private

  def create_checkout_checkin_mission
    if Mission.where(date: self.end_date, listing_id: self.listing_id, mission_type: 'last_check_out')
      p 'Merde'
    else
      mission = Mission.new(listing_id: self.listing_id, mission_type: 'checkout_checkin', date: self.end_date, price: self.listing.num_rooms * 10 )
      mission.save!
    end
  end
end
