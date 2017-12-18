class Meal < ApplicationRecord
  belongs_to :truck #, presence: true
  has_many :choices, dependent: :destroy

  validates :description, presence: true
  validates :price_cents, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 0
  validates :truck_id, presence: true
  has_attachment :photo

  monetize :price_cents
end
