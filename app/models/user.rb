class User < ActiveRecord::Base
  include Clearance::User
  has_many :shouts

  # This is how to access the relationship
  has_many :followed_user_relationships, foreign_key: "following_user_id", class_name: "FollowingRelationship"
  # To access the actual users themseleves, we need a has_many_throught
  has_many :followed_users, through: :followed_user_relationships

  # We're going to need a different relationship to describe what's going on here.
  has_many :following_user_relationships, foreign_key: "followed_user_id", class_name:"FollowingRelationship"
  has_many :followers, through: :following_user_relationships, source: :following_user

  # ALWAYS use attr_accessible
  attr_accessible :email, :password

  # Since it's chronologically ordered and belongs to the user.
  def shout_feed
    ShoutFeed.new self_and_followed_user_ids
  end

  def create_shout(medium)
    # A constructed object should be passed into here
    medium.save
    # We need to stub it on a Shout.new instead of the association record
    shouts.create(medium: medium)

    # We ned to stub it like this instead. but that also means we need to pass in the user id
    # Shout.new(user_id: id, medium: medium).save
  end

  def follow(user)
    # following_relationships.create(followed_user: user)
    followed_users << user
  end

  def can_follow?(user)
    # MATT's 2nd VERSION
    not self_and_followed_user_ids.include?(user.id)

    # MATT's 1st VERSION
    # This actually instantiates lot of user models
    # self != user && !followed_users.include?(user)

    # MY IMPLEMENTATION:
    # return false if user == self
    # return false if followed_users.include? user
    # return true  if !followed_users.include? user
  end

  private
  def self_and_followed_user_ids
    [id] + followed_user_ids
  end
end
