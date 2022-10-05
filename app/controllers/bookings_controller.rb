class BookingsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.post = @post
    if @booking.save
      # mail = BookingMailer.with(booking: @booking).booking_confirmation
      # mail.deliver_now
      if current_user.role == ""
        current_user.role = "candidat"
        current_user.save
      else
        redirect_to posts_path, notice: "Candidature transmise avec succès"
      end
    else
      redirect_to posts_path, alert: "Candidature déjà en cours...", status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.confirmation = true
    if @booking.save
      redirect_to archive_path, notice: "Candidature acceptée"
    else
      redirect_to archive_path, alert: "Erreur"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to archive_path, alert: "Candidature retirée"
    else
      redirect_to archive_path, alert: "Erreur"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:confirmation, :post_id, :user_id)
  end
end
