class User < ApplicationRecord
  belongs_to :registration
  has_many :choices
  has_many :baskets

  has_attachment :photo

  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
