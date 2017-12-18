class Address < ApplicationRecord
  belongs_to :truck
  has_many :calendars, dependent: :destroy

  geocoded_by :street_address
  after_validation :geocode, if: :street_address_changed?

  validates :street_address, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
