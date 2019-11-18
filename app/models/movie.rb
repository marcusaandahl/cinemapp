class Movie < ApplicationRecord
  has_many :sessions, dependent: :destroy
end
