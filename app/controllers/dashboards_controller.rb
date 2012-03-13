class DashboardsController < ApplicationController
  def show
    @text_shout = TextShout.new
    @photo_shout = PhotoShout.new
    #
    # If you used current_user.shouts.all, the query would be executed immediately.
    @shouts = current_user.shout_feed.shouts
    # Returns an ActiveRecord::Relation object.
    # ActiveRecord::Relation(table: shouts, where: { user_id: 1 }. order: "created_at desc"
  end
end
