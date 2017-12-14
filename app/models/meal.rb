class Meal < ApplicationRecord
  belongs_to :truck #, presence: true
  has_many :choices

  validates :truck_id, presence: true
end
