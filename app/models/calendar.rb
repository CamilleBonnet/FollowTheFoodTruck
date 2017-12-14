class Calendar < ApplicationRecord
  belongs_to :address

  validates :address_id, presence: true
end
