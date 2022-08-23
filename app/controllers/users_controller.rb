class UsersController < ApplicationController
  def dashboard
    @user_goals = policy_scope(UserGoal)
    authorize @user_goals
  end
end
