class CreateJoinTableLikes < ActiveRecord::Migration[5.1]
  def change
    create_join_table :photos, :users, table_name: :likes do |t|
      t.index [:photo_id, :user_id], unique: true # Can see all users who like a specific photo
      # t.index [:user_id, :photo_id], unique: true # Can see all photos liked by a specific person

      t.timestamp :created_at
    end
  end
end
