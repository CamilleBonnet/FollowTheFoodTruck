class Calendar < ApplicationRecord
  belongs_to :address
  belongs_to :truck

  validates :truck_id, presence: true
  validates :address_id, presence: true
  validates :starting_date, presence: true
  validates :ending_date, presence: true

  def start_time
    self.starting_date
  end

  def end_time
    self.ending_date
  end
end
