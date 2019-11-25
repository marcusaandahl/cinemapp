class Booking < ApplicationRecord
  belongs_to :order
  belongs_to :session
  belongs_to :seat

  validates :discounted_price, presence: true
end
