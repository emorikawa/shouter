class DashboardsController < ApplicationController
  def show
    @text_shout = TextShout.new
    #
    # If you used current_user.shouts.all, the query would be executed immediately.
    @shouts = current_user.shouts.current
    # Returns an ActiveRecord::Relation object.
    # ActiveRecord::Relation(table: shouts, where: { user_id: 1 }. order: "created_at desc"
  end
end
