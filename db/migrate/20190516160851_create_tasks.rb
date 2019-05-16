class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :room, foreign_key: true
      t.integer :type
      t.string :description

      t.timestamps
    end
  end
end
