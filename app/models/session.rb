class Session < ApplicationRecord
  has_many :slots

  def date
    self.scheduled_at&.to_date
  end

  def time
    self.scheduled_at&.to_time
  end

end
