class Choice < ApplicationRecord
  belongs_to :basket
  belongs_to :meal
  belongs_to :truck
  belongs_to :user

  # validates :basket_id, presence: true
  validates :meal_id, presence: true
  validates :truck_id, presence: true
  validates :user_id, presence: true
end
