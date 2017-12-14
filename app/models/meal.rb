class Meal < ApplicationRecord
  belongs_to :truck, dependent: :destroy #, presence: true
  has_many :choices

  validates :price, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 0
  validates :truck_id, presence: true
  has_attachment :photo
end
