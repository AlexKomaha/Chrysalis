class EmotionsController < ApplicationController
  def index
    @emotions = policy_scope(Emotion)
  end
end
