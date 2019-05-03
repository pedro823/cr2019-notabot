class Message < ApplicationRecord
  validates :author, presence: true, length: {minimum: 3, maximum: 15}
  validates :message, presence: true, length: {minimum:0, maximum:280}

  def self.delete_old
    self.where('updated_at < :time', {time: 15.minutes.ago}).destroy_all
  end

end
