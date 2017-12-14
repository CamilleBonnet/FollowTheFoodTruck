class Address < ApplicationRecord
  belongs_to :truck
  has_many :calendars

  validates :street_address, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
