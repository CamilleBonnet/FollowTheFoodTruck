class Meal < ApplicationRecord
  belongs_to :truck
  has_many :choices

  validates :price, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 100
  has_attachment :photo
end
