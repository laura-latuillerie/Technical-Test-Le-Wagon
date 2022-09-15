class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :missions, dependent: :destroy
  validates :num_rooms, presence: :true

  def bookings_count
    self.bookings.count
  end

  def reservations_count
    self.reservations.count
  end
end
