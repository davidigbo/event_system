class ConfirmationJob
    include Sidekiq::Worker

    def perform(booking)
      booking = Booking.find(booking_id)
      puts "Sending confirmation email to #{booking.user.eamil}"
    end
end