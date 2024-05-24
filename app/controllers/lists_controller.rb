class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  def index
    # Get all lists
    @lists = List.all
  end

  def show
    # Create a new bookmark instance to be used in the form
    @bookmark = Bookmark.new
    # If there is a query in the params do a filter
    if params[:query]
      @bookmarks = []
      search_movie = Movie.where("title ILIKE ?", "%#{params[:query]}%")
      @list.bookmarks.each do |bookmark|
        search_movie.each do |movie|
          bookmark.movie == movie ? @bookmarks << bookmark : nil
        end
      end
    # Else show all bookmarks
    else
      @bookmarks = @list.bookmarks
    end
    # Create a new review instance to be used in the form
    @review = Review.new
    # Return all reviews for the list
    @reviews = @list.reviews
  end

  def new
    # Create a new list instance to be used in the form
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List was successfully created."
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Set the list instance to be used in the before action
  def set_list
    @list = List.find(params[:id])
  end

  # Strong params for not getting other params
  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
