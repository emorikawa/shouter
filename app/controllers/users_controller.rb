class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shout_feed = ShoutFeed.new(@user.id)
  end
end
