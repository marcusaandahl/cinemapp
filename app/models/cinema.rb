class Cinema < ApplicationRecord
  # geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :rooms, dependent: :destroy
  has_many :sessions, through: :rooms
  has_many :movies, through: :sessions
  validates :name, presence: true
  validates :address, uniqueness: true, presence: true

end
