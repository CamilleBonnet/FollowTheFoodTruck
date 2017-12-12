class Truck < ApplicationRecord
  belongs_to :user
  has_many :meals
  has_many :addresses
end
