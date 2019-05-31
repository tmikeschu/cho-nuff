class UsersTask < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_one :room, through: :task
  has_one :house, through: :room

  delegate :name, to: :user, prefix: true
  delegate :name, :description, to: :task
end
