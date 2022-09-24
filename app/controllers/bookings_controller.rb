class BookingsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.post = @post
    if @booking.save
      mail = BookingMailer.with(booking: @booking).booking_confirmation
      mail.deliver_now
      redirect_to post_path(@post), notice: "Votre demande a bien été envoyée"
    else
      render "posts/show", alert: "Votre demande n'a pas pu être envoyée", status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to archive_path, alert: "Votre demande a bien été supprimée"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:confirmation, :post_id, :user_id)
  end
end
