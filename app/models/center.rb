class Center < ApplicationRecord
  has_many :admins
  has_many :departments
  has_many :rooms
end
