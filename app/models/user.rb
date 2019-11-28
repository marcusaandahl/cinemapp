class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :bookings, through: :orders
  has_many :sessions, through: :bookings

  validates :name, presence: true

  after_create do |user|
    customer = Stripe::Customer.create({
      email: user.email,
    })

    user.update(stripe_customer_id: customer.id)
  end
end
