class CandidaturesController < ApplicationController
  def index
    @user = current_user
    @bookings_recru = Booking.where(user_id: @user.id)
    @bookings_candi = Booking.where(post_id: @user.posts)
    @posts = Post.find(@bookings_candi.map(&:post_id))
  end
end
