class Choice < ApplicationRecord
  belongs_to :basket
  belongs_to :meal
  belongs_to :truck
  belongs_to :user
end
