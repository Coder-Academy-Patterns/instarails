class CreateJoinTableFollowers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :followed, :follower, table_name: :followers, column_options: { foreign_key: { to_table: :users } } do |t|
      t.index [:followed_id, :follower_id], unique: true
      t.index [:follower_id, :followed_id]
    end
  end
end
