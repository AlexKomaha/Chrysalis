class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @articles = policy_scope(Article)
    # location
    @locations = Location.all
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude
      }
    end
  end
end
