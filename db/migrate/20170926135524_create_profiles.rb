class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :username, null: false
      t.string :name
      t.text :bio

      t.timestamps

      t.index :username, unique: true
    end
  end
end
