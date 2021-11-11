class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    # todo
  end

  def new
    @bookmark = Bookmark.new
    # todo
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    # todo
  end
end
