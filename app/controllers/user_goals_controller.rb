class UserGoalsController < ApplicationController
  def index
    @user_goal = UserGoal.where(user_id: current_user)
    @user_goals = policy_scope(UserGoals)
  end

  def new
    @user_goal = UserGoal.new
    authorize @user_goal
    @goals = current_user.all_possible_descriptions
  end

  def create
    authorize @user_goal
    user_goal_params[:descriptions].each do |description|
      UserGoal.create(user: current_user, description: description)
    end
    redirect_to user_goals_path
  end

  private

  def user_goal_params
    params.require(:user_goal).permit(:status, :description, descriptions: [])
  end
end
