class EmotionsController < ApplicationController
  def index
    @emotions = policy_scope(Emotion)
    @emotion = Emotion.find_by(created_at: (Time.now.beginning_of_day..Time.now.end_of_day)) || Emotion.new
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    @emotions = @emotions.where(created_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def create
    @emotion = Emotion.new(emotion_params)
    @emotion.user = current_user
    authorize @emotion
    if @emotion.save
      redirect_to emotions_path
    else
      @emotions = policy_scope(Emotion)
      render :index
    end
  end

  def update
    @emotion = Emotion.find(params[:id])
    @emotion.assign_attributes(emotion_params)
    authorize @emotion
    if @emotion.save
      redirect_to emotions_path
    else
      @emotions = policy_scope(Emotion)
      render :index
    end
  end

  def emotion_params
    params.require(:emotion).permit(:emotion_level)
  end
end
