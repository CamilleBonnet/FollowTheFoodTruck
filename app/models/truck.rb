class Truck < ApplicationRecord
  belongs_to :user
  has_many :truck_order_lists
  has_many :meals
  has_many :addresses
end
