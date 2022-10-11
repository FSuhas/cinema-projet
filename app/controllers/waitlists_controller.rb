class WaitlistsController < ApplicationController
  before_action :set_role, only: %i[index]
  def index
    @user = current_user
    @bookings = Booking.where(post_id: @user.posts)
    @posts = Post.find(@bookings.map(&:post_id))
  end

  private

  def set_role
    if current_user.role == "candidat"
      redirect_to posts_path
    end
  end
end
