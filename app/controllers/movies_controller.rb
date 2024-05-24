class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @comment = Comment.new
  end
end
