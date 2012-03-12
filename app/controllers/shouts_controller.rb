class ShoutsController < ApplicationController
  def create
    shout = current_user.shouts.new(params[:shout])
    shout.save
    # flash[:notice] = "Shouted!" #notice: is a shorthand as is 'alert:'
    redirect_to dashboard_path, notice: "Shouted!"
  end

  def show
    @shout = Shout.find(params[:id])
  end
end
