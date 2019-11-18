class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :session
  belongs_to :seat
end
