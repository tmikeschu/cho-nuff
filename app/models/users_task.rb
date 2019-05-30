class UsersTask < ApplicationRecord
  belongs_to :task
  belongs_to :user

  delegate :name, to: :user, prefix: true
  delegate :name, :description, to: :task
end
