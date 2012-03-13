class SearchesController < ApplicationController
  def show
    # params[:search]
    @shouts = SearchIndex.search(params[:query])
  end
end
