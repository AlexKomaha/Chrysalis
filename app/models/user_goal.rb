class UserGoal < ApplicationRecord
  belongs_to :user
  validates :status, presence: true
  validates :description, presence: true
  enum status: [ :active, :done, :inactive ]

  SUGGESTED = ["Edit resume", "Change the bedsheets", "Make myself dinner"]
end
