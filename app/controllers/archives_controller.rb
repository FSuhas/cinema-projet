class ArchivesController < ApplicationController

  def archive
    @user = current_user
    if current_user.role == "recruteur"
      @bookings = Booking.where(post_id: @user.posts)
      @posts = Post.where(user_id: @user)
    else
      @bookings = Booking.where(user_id: @user)
    end
  end

  def update
      @user = current_user
    if current_user.update(user_params)
      redirect_to archive_path
    else
      render :archive
    end
  end

  private

  def user_params
    params.require(:booking).permit(:titre, :role, :age, :genre, :ville, :departement, :lieux, :date, :descriptif, :user_id, photos: [])
  end
end
