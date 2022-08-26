class JournalsController < ApplicationController
  def index
    @journals = policy_scope(Journal)

    if params[:month]
      month_number = Date::MONTHNAMES.index(params[:month])
      @journals = Journal.where('extract(month from created_at) = ?', month_number)
      authorize @journals
    end
  end

  def show
    @journal = Journal.find(params[:id])
    authorize @journal
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

  private

  def journal_params
    params.require(:journal).permit(:rich_content, :title, :user_id)
  end
end
