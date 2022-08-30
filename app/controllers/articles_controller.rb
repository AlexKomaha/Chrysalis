class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @articles = policy_scope(Article)
  end
end
