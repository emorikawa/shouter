class Shout < ActiveRecord::Base
  belongs_to :user

  def self.current
    order("created_at DESC") # Standard query syntax. returns active record relation.
  end
end
