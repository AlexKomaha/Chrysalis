class Emotion < ApplicationRecord
  belongs_to :user
  validates :emotion_level, presence: true, numericality: { in: 1..8 }
end
