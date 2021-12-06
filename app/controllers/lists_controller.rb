class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def new
    @list = List.new
    @movie = Movie.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(strong_params)
    if @list.save
      redirect_to list_path(@list)
    else
      @lists = List.all
      render :index
    end
  end

  def edit
    @list = List.find(params[:id])
    @list.update(strong_params)
    if @list.save
      redirect_to lists_path
    else
      render :show
    end
  end

  def update
    @list = List.new(strong_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def strong_params
    params.require(:list).permit(:name, :photo)
  end
end
