class AddRagToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :rag, :integer, default: 0
  end
end
