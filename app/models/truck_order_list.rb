class TruckOrderList < ApplicationRecord
  belongs_to :truck
  has_many :baskets, dependent: :destroy

  validates :truck_id, presence: true
end
