class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  before_action :set_bookmark, only: %i[destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list), notice: "Bookmark was successfully created. "
    else
      @review = Review.new
      render template: "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: "Bookmark was successfully deleted. "
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
