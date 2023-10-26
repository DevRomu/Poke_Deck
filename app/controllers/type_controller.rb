class TypeController < ApplicationController
  def index
    @types = Type.page(params[:page]).per(6)
  end

  def show
    @type = Type.find(params[:id])
    @pokemons = @type.pokemons
  end
end
