class Goal < ApplicationRecord
  validates :description, presence: true
  has_many :user_goals
end
