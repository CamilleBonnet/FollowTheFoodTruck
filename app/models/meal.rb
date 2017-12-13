class Meal < ApplicationRecord
  belongs_to :truck
  has_many :choices
  has_attachments :photos, maximum: 1
end
