class Captcha < ApplicationRecord
  validates :challenge, presence: true
  validates :answer, presence: true

  def is_correct?(answer)
    self.answer == answer.to_s.strip
  end
end