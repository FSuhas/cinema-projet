class CandidatsController < ApplicationController
  before_action :set_role, only: %i[index]

  def index
    @user = current_user
    @count = User.where(role: "candidat").count
    if params[:query].present?
      @candidats = User.where(role: "candidat").search_by_query(params[:query])
    else
      @candidats = User.where(role: "candidat")
    end
  end

  private

  def set_role
    if current_user.role == "candidat"
      redirect_to posts_path
    else
      current_user.role = "recruteur"
      current_user.save
    end
  end
end
