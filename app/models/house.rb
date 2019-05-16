class House < ApplicationRecord
  has_many :rooms
  has_many :tasks, through: :rooms
  has_many :users_houses
  has_many :users, through: :users_houses
end
