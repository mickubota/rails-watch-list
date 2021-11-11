class MovieController < ApplicationController
  def new
    @list = list.find(params[:list_id])
    @movie = List.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
