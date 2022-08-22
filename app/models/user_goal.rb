class UserGoal < ApplicationRecord
  belongs_to :user
  validates :status, presence: true
  validates :description, presence: true
  enum status: [ :inactive, :active, :done ]
end
