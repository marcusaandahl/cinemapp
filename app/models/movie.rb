class Movie < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :rooms, through: :sessions
  has_many :cinemas, through: :rooms

  validates :name, uniqueness: true, presence: true
end
