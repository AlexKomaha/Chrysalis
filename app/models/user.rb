class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :user_goals, dependent: :destroy
  has_many :journals, dependent: :destroy
  has_many :emotions, dependent: :destroy
  has_many :goals, through: :user_goals
  validates :first_name, presence: true
  validates :last_name, presence: true

  def previous_goal_descriptions
    user_goals.pluck(:description).uniq
  end

  def all_possible_descriptions
    (previous_goal_descriptions + UserGoal::SUGGESTED).uniq
  end

  def set_streak
    days = (last_sign_in_at.to_date - previous_sign_in_at.to_date).to_i
    if days > 1
      self.streak_count = 0
    elsif days == 1
      self.streak_count += 1
    end
    self.previous_sign_in_at = last_sign_in_at
    self.save
  end
end
