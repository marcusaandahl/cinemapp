class Cinema < ApplicationRecord
  has_many :rooms, dependent: :destroy
end
