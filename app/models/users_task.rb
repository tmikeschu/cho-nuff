class UsersTask < ApplicationRecord
  belongs_to :task
  belongs_to :user

  delegate :name, to: :task
end
