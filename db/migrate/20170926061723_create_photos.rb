class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :image_data
      t.references :user, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
