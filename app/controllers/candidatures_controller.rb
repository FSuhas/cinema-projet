class CandidaturesController < ApplicationController
  before_action :set_role, only: %i[index]
  def index
    @user = current_user
    @bookings = Booking.where(user_id: @user.id)
  end

  private

  def set_role
    if current_user.role == "recruteur"
      redirect_to candidats_path
    end
  end
end
