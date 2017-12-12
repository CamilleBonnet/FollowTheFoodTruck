class Truck < ApplicationRecord
  belongs_to :user
  has_many :truck_order_lists
end
