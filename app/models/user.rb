class User < ActiveRecord::Base
  has_many :shouts
  has_many :followed_user_relationships,
            class_name: "FollowingRelationship",
            foreign_key: :follower_id

  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
            class_name: "FollowingRelationship",
            foreign_key: :followed_user_id

  has_many :followers, through: :follower_relationships

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def timeline
    Shout.where(user_id: [id] + followed_user_ids).order(created_at: :desc)
  end

  def following?(user)
    followed_users.include?(user)
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.delete(user)
  end

  def to_param
    username
  end
end
