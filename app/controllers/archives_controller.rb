class ArchivesController < ApplicationController

  def archive
    @user = current_user
    @booking = Booking.where(user_id: current_user).order(created_at: :asc)
  end
end
