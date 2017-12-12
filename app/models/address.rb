class Address < ApplicationRecord
  belongs_to :truck
  has_many :calendars
end
