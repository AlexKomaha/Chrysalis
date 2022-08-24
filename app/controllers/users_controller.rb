class UsersController < ApplicationController
  def dashboard
    @user_goal = UserGoal.where(user_id: current_user)
    @user_goals = policy_scope(UserGoal).group_by(&:description)
    authorize @user_goals
  end
end
