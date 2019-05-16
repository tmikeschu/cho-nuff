class CreateUsersHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :users_houses do |t|
      t.references :user, foreign_key: true
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
