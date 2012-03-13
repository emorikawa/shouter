class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :medium, polymorphic: true
  after_create :index_medium

  def self.current
    order("created_at DESC") # Standard query syntax. returns active record relation.
  end

  def index_medium
    medium.index
  end

  # # Shout.all.map(&:medium).map(&:index)
  # def save_and_index
  #   save
  #   medium.index
  # end

  # def self.search(query)
  #   ## EVAN's IMPLEMENTATION
  #   # escaped_query = query.gsub('%', '\%').gsub('_', '\_')
  #   # TextShout.search(escaped_query) | PhotoShout.search(escaped_query)

  #   # MATT's 1st Try
  #   # Don't want this because it returns an array instead of an active record relation.
  #   # TextShout.search(query).map(&:query)

  #   # Shout.scoped is kind of like Shout.all but only retruns the
  #   # ActiveRecord::Relation
  #   #
  #   # MATT's 2nd Try
  #   # Use and index
  #   # No more search method in shout.rb
  # end

  # private
  # def self.text_shout_search_conditions(query)
  #   TextShout.search_conditions_for(query)
  # end
end
