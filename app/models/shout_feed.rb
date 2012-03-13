class ShoutFeed
  # Allows us to render
  extend ActiveModel::Naming

  # # Adds to the instance methods
  # include ActiveModel::Naming
  # def foo #include
  # end

  # # Adds to the class methods
  # extend ActiveModel::Naming
  # def self.bar #extend
  # end

  def initialize(user_ids)
    @user_ids = user_ids
  end

  def shouts
    Shout.where(user_id: @user_ids).current
  end
end
