class Session < ApplicationRecord
  validates :showtime, uniqueness: true, presence: true
end
