class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy
end
