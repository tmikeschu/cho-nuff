class Task < ApplicationRecord
  belongs_to :room
  has_one :house, through: :room
  has_many :users_tasks
  has_many :users, through: :users_tasks

  enum task_type: %i[mop organize sweep trash vacuum wipe]
  enum rag: %i[dust kitchen polish porcelain range stainless window]
end
