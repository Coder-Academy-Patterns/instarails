class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :photos
  # The people who follow us
  has_and_belongs_to_many :followers, class_name: 'User', join_table: :followers,
    foreign_key: :followed_id, association_foreign_key: :follower_id
  # The people we follow
  has_and_belongs_to_many :following, class_name: 'User', join_table: :followers,
    foreign_key: :follower_id, association_foreign_key: :followed_id

  # Does `user` follow us?
  def followed_by?(user)
    followers.exists?(user.id)
  end

  def toggle_followed_by(user)
    # If currently following, we unfollow
    if followers.exists?(user.id)
      followers.destroy(user)
    # If currently not following, we follow
    else
      followers << user
    end
  end
end
