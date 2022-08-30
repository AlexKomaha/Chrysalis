class JournalsController < ApplicationController
  def index
    @journals = policy_scope(Journal).order(created_at: :desc)

    if params[:month]
      month_number = Date::MONTHNAMES.index(params[:month])
      @journals = @journals.where('extract(month from created_at) = ?', month_number)
      # authorize @journals
    else
      @journals = @journals.where('extract(month from created_at) = ?', Date.today.month)
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

  # To format the date with st, rd, nd, th. E.g. 21st
  # def format(time)
  #   time.strftime("%A %-d, %l:%M%P").sub!(/\d?\d/) do |day|
  #     case day
  #     when "1", "21", "31" then "#{day}st"
  #     when "2", "22" then "#{day}nd"
  #     when "3", "23" then "#{day}rd"
  #     else "#{day}th"
  #     end
  #   end
  # end

  private

  def journal_params
    params.require(:journal).permit(:rich_content, :title, :user_id)
  end
end
