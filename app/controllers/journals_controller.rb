class JournalsController < ApplicationController
  def index
    @journals = policy_scope(Journal).order(created_at: :asc)

    if params[:month]
      month_number = Date::MONTHNAMES.index(params[:month])
      @journals = @journals.where('extract(month from created_at) = ?', month_number)
      # authorize @journals
    else
      @journals = @journals.where('extract(month from created_at) = ?', Date.new(2022, 9, 1).month)
    end
  end

  def show
    @journal = Journal.find(params[:id])
    authorize @journal
    @emotion_of_day = Emotion.where(created_at: @journal.created_at.beginning_of_day..@journal.created_at.end_of_day).first
    tm = TextMood.new(language: "en", normalize_score: true)
    @score = tm.analyze(@journal.content || @journal.rich_content.to_plain_text)
    if @score.negative?
      @score = 30
    elsif @score <= 70
      @score += 30
    else
      @score
    end
  end

  def new
    @journal = Journal.new
    authorize @journal
  end

  def create
    @journal = Journal.new(journal_params)
    @journal.user = current_user
    authorize @journal
    if @journal.save
      redirect_to journals_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @journal = Journal.find(params[:id])
    authorize @journal
  end

  def update
    @journal = Journal.new(journal_params)
    @journal = Journal.find(params[:id])
    authorize @journal
    @journal.update(journal_params)
    redirect_to journals_path
  end

  private

  def journal_params
    params.require(:journal).permit(:content, :title, :user_id)
  end
end
