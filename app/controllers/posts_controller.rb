class PostsController < ApplicationController

  def new
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @booking = Booking.new
  end
end
