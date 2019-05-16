class Room < ApplicationRecord
  belongs_to :house
  has_many :tasks
end
