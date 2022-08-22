class UserGoal < ApplicationRecord
  belongs_to :user
  belongs_to :goal, optional: true
  validates :status, presence: true
  validate :check_description

  def check_description
    if description.nil? && goal.nil?
      errors.add(:description, "You need the description if there's no goal.")
    elsif description && goal
      errors.add(:description, "You can't have the user-goal description with the goal.")
    end
  end

  def description
    super || goal.description
  end
end
