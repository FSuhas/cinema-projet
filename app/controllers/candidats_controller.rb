class CandidatsController < ApplicationController

  def index
    @user = current_user
    @candidats = User.where(role: "candidat")
  end
end
