class Task < ApplicationRecord
  belongs_to :room
  has_many :users_tasks
  has_many :users, through: :users_tasks

  enum type: %i[mop organize sweep trash vacuum wipe]
  enum rag: %i[dust kitchen polish porcelain range stainless window]
end
