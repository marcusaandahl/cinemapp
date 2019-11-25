class Order < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  monetize :price_cents

  validates :state, presence: true

  def price_update
    bookings_amount = bookings.count
    discount_price = bookings.first.session.current_discounted_price
    return bookings_amount * discount_price.to_i
  end
end
