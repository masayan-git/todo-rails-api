class CreateApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :api_keys do |t|
      t.string :key
      t.integer :access_level

      t.timestamps
    end
  end
end
