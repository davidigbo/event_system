class User < ApplicationRecord
    has_secure_password
    enum role: { customer:0, organizer: 1 }

    has_many evets, dependent: :destroy
    has_many bookings, dependent: :destroy
end
