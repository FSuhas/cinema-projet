class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_role, only: %i[index]

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
      redirect_to archive_path, notice: "Post créé avec succès"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to archive_path, notice: "Post supprimé"
    else
      render :archive, status: :unprocessable_entity, notice: "Post non supprimé"
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_role
    if current_user.role == "recruteur"
      redirect_to candidats_path
    else
      current_user.role = "candidat"
      current_user.save
    end
  end

  def post_params
    params.require(:post).permit(:titre, :role, :age, :genre, :ville, :departement, :lieux, :date, :descriptif, :user_id, photos: [])
  end
end
