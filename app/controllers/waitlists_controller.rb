class WaitlistsController < ApplicationController
  def index
    @user = current_user
    @bookings = Booking.where(post_id: @user.posts)
    @posts = Post.find(@bookings.map(&:post_id))
  end
end
