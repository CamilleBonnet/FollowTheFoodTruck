class TruckOrderList < ApplicationRecord
  belongs_to :truck
  has_many :baskets, dependent: :destroy
end
