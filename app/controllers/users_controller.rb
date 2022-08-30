# require "http"
require "json"
require "open-uri"

class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: :dashboard

  def dashboard
    @user_goals = policy_scope(UserGoal).group_by(&:description)
    @today_goals = UserGoal.where(created_at: Date.today.all_day) && UserGoal.where(status: "active")
    @colors = ["blue", "green", "purple", "orange"]
    @emotions = current_user.emotions
    @quotes = fetch_quotes
    @header = true
  end

  def fetch_quotes
    url = "https://zenquotes.io/api/quotes"
    response = URI.open(url).read
    quotes_array = JSON.parse(response)
    quotes_array.first["q"]
  end

  # def fetch_quotes
  #   require "json"
  #   require "open-uri"
  #   HTTP.get("https://zenquotes.io/api/quotes")
  # end
end
