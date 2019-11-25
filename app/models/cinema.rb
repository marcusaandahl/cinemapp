class Cinema < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :sessions, through: :rooms
  has_many :movies, through: :sessions
  validates :name, presence: true
  validates :address, uniqueness: true, presence: true
end
