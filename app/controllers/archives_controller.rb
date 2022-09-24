class ArchivesController < ApplicationController

  def archive
    @user = current_user
    @booking = Booking.where(user_id: current_user)
  end
end
