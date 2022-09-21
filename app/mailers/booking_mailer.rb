class BookingMailer < ApplicationMailer

  def booking_confirmation
    @booking = params[:booking]
    mail(to: @booking.user.email, subject: 'Votre candidature a bien été envoyée')
  end
end
