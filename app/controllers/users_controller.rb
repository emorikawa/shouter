class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shouts = ShoutFeed.new(@user.id).shouts
  end
end
