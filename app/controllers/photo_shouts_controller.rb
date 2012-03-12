class PhotoShoutsController < ApplicationController
  def create
    shout = current_user.create_shout PhotoShout.new(params[:photo_shout])
    # photo_shout = PhotoShout.new(params[:photo_shout])
    # shout = current_user.shouts.new(medium: photo_shout)
    # shout.save
    redirect_to dashboard_path, notice: "Shouted!"
  end
end
