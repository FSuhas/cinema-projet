class ArchivesController < ApplicationController
  before_action :set_role, only: %i[archive]
  def archive
    @user = current_user
    @bookings = Booking.where(post_id: @user.posts)
    @posts = Post.where(user_id: @user.id)
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  private

  def set_role
    if current_user.role == "candidat"
      redirect_to posts_path
    end

  end

  def user_params
    params.require('/archive').permit(:titre, :role, :age, :genre,
      :ville, :departement, :lieux, :date, :descriptif, :user_id, photos: [])
  end
end
