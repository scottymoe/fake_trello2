class BoardsController < ApplicationController
  # before_action :set_board, :only [:show, :edit]

  def index
    @boards = current_user.boards
  end

  def show
  end

  def new
    @board = Board.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @board = current_user.boards.new(board_params)

    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
