class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show]

  def index
    @user = current_user
    if params[:query].present?
      @posts = Post.search_by_query(params[:query])
    else
      @posts = Post.all
    end
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @booking = Booking.new
    @books = current_user.books
  end

  def new
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:titre, :role, :age, :genre, :ville, :departement, :lieux, :date, :descriptif, :user_id, photos: [])
  end
end
