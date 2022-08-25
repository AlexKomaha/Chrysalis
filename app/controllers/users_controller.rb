class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: :dashboard

  def dashboard
    @user_goals = policy_scope(UserGoal).group_by(&:description)
    @today_goals = UserGoal.where(created_at: Date.today.all_day)
    @colors = ["blue", "green", "purple", "orange"]
  end
end
