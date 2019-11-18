class Room < ApplicationRecord
  belongs_to :cinema
  # dependent?
  has_many :seats, dependent: :destroy
  has_many :sessions

  validates :name, presence: true
end
