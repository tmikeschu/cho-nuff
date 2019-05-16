class RemoveDefaultFromTaskRag < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tasks, :rag, nil)
  end
end
