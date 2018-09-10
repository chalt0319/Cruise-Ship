class Ship < ApplicationRecord
  has_many :passengers
  belongs_to :captain

  validates :name, presence: true
  # validates :name, uniqueness: true
  validates :capacity, presence: true
  validates :number_of_swimming_pools, presence: true

  def self.largest_ship
    Ship.order("capacity DESC").limit(1)[0]
  end

end
