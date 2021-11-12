class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(list: params[:list_id])
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  # def new
  #   @list = List.find(params[:list_id])
  #   @bookmark = Bookmark.new
  #   # todo
  # end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(strong_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list.id)
    else
      @list = List.find(params[:list_id])
      @bookmarks = @list.bookmarks
      @bookmark = Bookmark.new
      render "lists/show.html.erb"
    end
    # todo
  end

  def edit
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    # todo
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark_list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@bookmark_list)
  end

  def update
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    # todo
  end

  def show
    @bookmark = Bookmark.find(params[:list_id])
    # todo
  end

  private

  def strong_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
