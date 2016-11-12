class Reservation < ApplicationRecord
  belongs_to :teacher
  belongs_to :room
  belongs_to :observation
end
