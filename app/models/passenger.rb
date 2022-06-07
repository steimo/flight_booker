class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 2 }

  validates :email, presence: true

  has_and_belongs_to_many :bookings
  has_many :flights, through: :bookings
end
