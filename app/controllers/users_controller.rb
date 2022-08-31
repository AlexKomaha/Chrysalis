# require "http"
require "json"
require "open-uri"

class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: :dashboard

  def dashboard
    @user_goals = policy_scope(UserGoal).group_by(&:description)
    @today_goals = UserGoal.where(user: current_user).where(created_at: Date.today.all_day) && UserGoal.where(status: "active")
    @recent_goals = UserGoal.where(user: current_user).order(created_at: :desc).first(6)
    @colors = ["blue", "green", "purple", "orange"]
    @emotions = current_user.emotions
    response = fetch_quotes
    @quotes = response[:quote]
    @author = response[:author]
    @articles = Article.where(title: "What You Can Do to Cope With Anxiety")
    @header = true
    @journals = policy_scope(Journal).last(1)
  end

  def fetch_quotes
    url = "https://zenquotes.io/api/quotes"
    response = URI.open(url).read
    quotes_array = JSON.parse(response)
    {quote: quotes_array.first["q"], author: quotes_array.first["a"]}
  end

  # def fetch_author
  #   url = "https://zenquotes.io/api/quotes"
  #   response = URI.open(url).read
  #   quotes_array = JSON.parse(response)
  #   quotes_array.first["a"]
  # end

  # def fetch_quotes
  #   require "json"
  #   require "open-uri"
  #   HTTP.get("https://zenquotes.io/api/quotes")
  # end
end
