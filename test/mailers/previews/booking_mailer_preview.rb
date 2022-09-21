class BookingMailerPreview < ActionMailer::Preview
  def booking_confirmation
    booking = Booking.first
    BookingMailer.with(booking: booking).booking_confirmation
  end
end
