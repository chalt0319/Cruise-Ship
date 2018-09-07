class Passenger < ApplicationRecord

  has_secure_password
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :password, presence: true


  belongs_to :ship
  has_many :passenger_excursions
  has_many :excursions, through: :passenger_excursions
  has_many :ports, through: :excursions

  def total_excursion_time
    @total = 0
    self.excursions.each do |e|
      @total += e.duration
    end
    @total
  end

end
