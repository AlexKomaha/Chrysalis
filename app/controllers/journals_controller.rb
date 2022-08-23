class JournalsController < ApplicationController
  def index
    @journals = policy_scope(Journal)
  end

  def show
    @journal = Journal.find(params[:id])
    authorize @journal
  end
end
