class Department < ApplicationRecord
  belongs_to :center
  has_many :teachers
end
