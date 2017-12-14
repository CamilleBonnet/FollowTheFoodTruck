class Basket < ApplicationRecord
  belongs_to :user
  belongs_to :truck_order_list
  belongs_to :truck
  has_many :choices, dependent: :destroy

  validates :user_id, presence: true
  validates :status, presence: true
  # validates :truck_order_list_id, presence: true
end
