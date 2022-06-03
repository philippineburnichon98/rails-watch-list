class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
    @list = List.find(params[:id])
    @movies = @list.movies
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'list created.'
    else
      render :new
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
