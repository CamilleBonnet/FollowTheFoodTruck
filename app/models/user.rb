class User < ApplicationRecord
  belongs_to :registration
  has_many :choices
  has_many :baskets

  has_attachment  :photo
end
