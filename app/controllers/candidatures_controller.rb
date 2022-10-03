class CandidaturesController < ApplicationController

  def index
    @user = current_user
    @bookings = Booking.where(post_id: @user.posts)
    @posts = Post.where(user_id: @user)
  end
end
