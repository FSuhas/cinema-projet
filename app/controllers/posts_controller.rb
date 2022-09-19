class PostsController < ApplicationController

  def new
  end

  def show
    @post = Post.find(params[:id])
    @booking = Booking.new
  end
end
