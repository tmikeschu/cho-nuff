class AddPassphraseToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :passphrase, :string, required: true
  end
end
