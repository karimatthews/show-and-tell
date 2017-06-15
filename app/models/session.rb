require 'digest/md5'

class Session < ApplicationRecord
  has_many :slots
  after_create :generate_hash

  def date
    self.scheduled_at&.to_date
  end

  def time
    self.scheduled_at&.to_time
  end

  private

  def generate_hash
    raise "Can't generate hash twice!" if self.unique_hash.present?
    hash = Digest::MD5.hexdigest("#{self.id},#{self.company},#{self.about},#{Time.now.to_s}")
    self.update_attribute(:unique_hash, hash)
  end
end
