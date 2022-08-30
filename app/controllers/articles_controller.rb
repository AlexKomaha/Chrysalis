class ArticlesController < ApplicationController
  def index
    @article = Article.all
    @article = policy_scope(Article)
  end
end
