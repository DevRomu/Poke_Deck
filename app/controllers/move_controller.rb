class MoveController < ApplicationController
  def index
    @moves = Move.page(params[:page]).per(15)
  end

  def show
    @move = Move.find(params[:id])
    @pokemons = @move.pokemons
  end
end
