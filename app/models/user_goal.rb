class UserGoal < ApplicationRecord
  belongs_to :user
  validates :status, presence: true
  validates :description, presence: true
  enum status: [ :active, :done, :inactive ]

  SUGGESTED = ["Call grandma", "Change the bedsheets"]
end
