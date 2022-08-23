class UserGoalsController < ApplicationController
  def index
    @user_goal = UserGoal.where(user_id: current_user)
    @user_goals = policy_scope(UserGoal)
  end

  def new
    @user_goal = UserGoal.new
    # authorize @user_goal
  end

  def create
    raise
  end
end
