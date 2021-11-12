class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
    # todo
  end

  def new
    @list = List.new
    @movie = Movie.new
    # todo
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    # todo
  end

  def create
    @list = List.new(strong_params)
    if @list.save
      redirect_to list_path(@list)
    else
      @lists = List.all
      render :index
    end
      # todo
  end

  def edit
    @list = List.find(params[:id])
    @list.update(strong_params)
    if @list.save
      redirect_to lists_path
    else
      render :show
    end
      # todo
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
