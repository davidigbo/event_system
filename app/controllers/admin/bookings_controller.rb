module Admin
  class BookingsController < Admin::ApplicationController
     before_action :require_customer

  def index
    @bookings = current_user.bookings
  end
  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.after_save
      ConfirmationJob.perform_async(@booking.id)
      redirect_to booking_path, notice: 'Ticket booked!'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:ticket_id, :quantity)
  end

  def require_customer
    unless current_user&.customer?
      redirect_to events_path, alert: 'Access denied'
    end
  end
  end
end
