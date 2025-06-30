class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  def total_price
    ticket.price * quantity
  end
end
