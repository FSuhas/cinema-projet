class PostsController < ApplicationController

  def new
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @booking = Booking.new
  end

  def post_params
    params.require(:post).permit(:titre, :role, :age, :genre, :ville, :departement, :lieux, :date, :descriptif, :user_id, photos: [])
  end
end
