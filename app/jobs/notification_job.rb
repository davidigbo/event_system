class NotificationJob
    include Sidekiq::Worker

    def perform(event_id)
        event = Event.find(event_id)
        event.tickets.each do |ticket|
          ticket.bookings.each do |booking|
            puts "Notification #{booking.user.email} about the event update."
          end
        end
    end
end