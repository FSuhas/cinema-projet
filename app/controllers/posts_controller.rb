class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show]

  def index
    @user = current_user
    if params[:query].present?
      @posts = Post.search_by_query(params[:query]).order(date: :asc)
    else
      @posts = Post.all.order(date: :asc)
    end
  end


  def show
    @user = current_user
    @post = Post.find(params[:id])
    @booking = Booking.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: "Post créé avec succès"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to archive_path, notice: "Post supprimé"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:titre, :role, :age, :genre, :ville, :departement, :lieux, :date, :descriptif, :user_id, photos: [])
  end
end
