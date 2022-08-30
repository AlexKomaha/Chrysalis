class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @articles = policy_scope(Article)
    # location
    @locations = Location.all
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        popup_html: render_to_string(partial: 'articles/map_popup', locals: { location: location })
      }
    end
  end
end
