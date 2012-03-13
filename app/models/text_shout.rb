class TextShout < ActiveRecord::Base
  has_one :shout, as: :medium
  # after_create :create_index

  # def create_index
  #   SearchIndex.create(shout: shout, index: body)
  # end

  def index
    SearchIndex.create(shout: shout, data: body)
  end

  # EVAN's IMPLEMENTATIOn
  # def self.search(escaped_query)
  #   where("body LIKE ?", "%#{escaped_query}%")
  # end

  # MATT's IMPLEMENTATION
  # def self.search_conditions_for(query)
  #   joins(<<-SQL
  #     JOIN 
  #   SQL)
  #   

  #   ["text_shouts.body LIKE ?", "%#{query}%"]
  # end

end
