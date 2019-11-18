class Cinema < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :name, presence: true
  validates :address, uniqueness: true, presence: true
end
