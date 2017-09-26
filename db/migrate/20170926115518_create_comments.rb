class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :photo, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content

      t.timestamps

      t.index :created_at # So we can order chronologically
    end
  end
end
