class Truck < ApplicationRecord
  belongs_to :user
  has_many :truck_order_lists, dependent: :destroy
  has_many :meals, dependent: :destroy
  has_many :addresses, dependent: :destroy
  validates :user_id, presence: true, uniqueness: true
  has_attachments :photos, maximum: 2
end
