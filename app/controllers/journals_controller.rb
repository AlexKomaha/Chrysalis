class JournalsController < ApplicationController
  def index
    @journals = policy_scope(Journal)
  end
end
