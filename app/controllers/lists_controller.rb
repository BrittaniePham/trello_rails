class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy, :update_list_priority]

  def index
    @lists = @board.lists
  end

  def show
  end

  def new
    @list = List.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @list = @board.lists.new(list_params)

    max = @board.lists.maximum('priority')
    @list.priority = max + 1

    if @list.save
      redirect_to board_path(@board)
    else
      render :form
    end
  end

  def update
    if @list.update(list_params)
      redirect_to board_path(@board)
    else
      render :form
    end
  end

  def destroy ###### FIX ME
    destroyed = @list.destroy

    @board.lists.each do |list|
      if list.priority > destroyed.priority
        list.priority = list.priority - 1
      end
    end

    redirect_to board_path(@board)
  end

  def update_list_priority
    list_to_move_down = @board.lists.find_by(priority: @list.priority - 1)
    @list.update(priority: list_to_move_down.priority) #delete a list, the rest of the numbers do not change
    list_to_move_down.update(priority: list_to_move_down.priority + 1)

    redirect_to board_path(@list.board_id)
  end

  private
  def set_list
    @list = List.find(params[:id])
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def list_params
    params.require(:list).permit(:title, :priority)
  end
end
