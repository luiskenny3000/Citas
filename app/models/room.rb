class Room < ApplicationRecord
  belongs_to :center
  has_many :disables
  has_many :reservations
  has_and_belongs_to_many :resources
end
