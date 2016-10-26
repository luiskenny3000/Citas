class Room < ApplicationRecord
  belongs_to :center
  has_many :disable
  has_many :reservation
  has_and_belongs_to_many :resources
end
