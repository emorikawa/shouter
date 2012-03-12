class User < ActiveRecord::Base
  include Clearance::User
  has_many :shouts

  def create_shout(medium)
    # A constructed object should be passed into here
    medium.save
    # We need to stub it on a Shout.new instead of the association record
    shouts.create(medium: medium)

    # We ned to stub it like this instead. but that also means we need to pass in the user id
    # Shout.new(user_id: id, medium: medium).save
  end
end
