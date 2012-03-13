class PhotoShout < ActiveRecord::Base
  has_attached_file :photo, styles: {
    thumb: "120x120"
  }
  has_one :shout, as: :medium
  # after_create :create_index

  def index
    SearchIndex.create(shout: shout, data: photo_file_name)
  end

  # def create_index
  #   SearchIndex.create(shout: shout, index: photo_file_name)
  # end

  def self.search(escaped_query)
    where("photo_file_name LIKE ?", "%#{escaped_query}%")
  end
end
