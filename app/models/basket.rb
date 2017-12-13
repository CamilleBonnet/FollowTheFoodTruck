class Basket < ApplicationRecord
  belongs_to :user
  belongs_to :truck_order_list
  has_many :choices, dependent: :destroy
end
