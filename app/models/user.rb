# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :microposts, dependent: :destroy
  has_many :active_follows,  class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :passive_follows, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed
  has_many :following, through: :active_follows,  source: :followed
  has_many :followers, through: :passive_follows, source: :follower

  def follow(other_user)
    active_follows.create(followed_id: other_user)
  end

  def unfollow(other_user)
    active_follows.find_by(followed_id: other_user).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
end
