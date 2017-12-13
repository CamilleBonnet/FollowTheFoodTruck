class Meal < ApplicationRecord
  belongs_to :truck
  has_many :choices

  has_attachment :photo
end
