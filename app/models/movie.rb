class Movie < ApplicationRecord
  has_many :sessions, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
