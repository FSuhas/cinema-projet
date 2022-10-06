class CandidaturesController < ApplicationController
  def index
    @user = current_user
    @bookings = Booking.where(user_id: @user.id)
  end
end
