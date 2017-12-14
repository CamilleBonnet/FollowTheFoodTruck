class User < ApplicationRecord
  belongs_to :registration

  has_many :choices, dependent: :destroy
  has_many :baskets, dependent: :destroy
  has_many :trucks, dependent: :destroy

  has_attachment :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
end
