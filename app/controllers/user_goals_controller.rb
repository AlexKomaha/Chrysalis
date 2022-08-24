class UserGoalsController < ApplicationController
  def index
    @user_goal = UserGoal.where(user_id: current_user)
    @user_goals = policy_scope(UserGoal).group_by(&:description)
  end

  def new
    @user_goal = UserGoal.new
    authorize @user_goal
    @goals = current_user.all_possible_descriptions
  end

  def create
    user_goal_params[:descriptions].each do |description|
      user_goal = UserGoal.create(user: current_user, description: description)
      authorize user_goal
    end
    redirect_to user_goals_path
  end

  private

  def user_goal_params
    params.require(:user_goal).permit(:status, :description, descriptions: [])
  end
end
