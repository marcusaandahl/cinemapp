class Order < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  monetize :price_cents

  validates :state, presence: true

  def price_update
    unless bookings.first.nil?
      bookings_amount = bookings.count
      discount_price = bookings.first.session.current_discounted_price[0]
      return bookings_amount * discount_price.to_i
    else
      return 0
    end
  end
end
