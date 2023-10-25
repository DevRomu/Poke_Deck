class PokemonController < ApplicationController
    def index
        @pokemons = Pokemon.page(params[:page]).per(25)
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        @moves = @pokemon.moves
        @types = @pokemon.types
    end

    def search
        wildcard_search = "%#{params[:keywords]}%"
        @pokemons = Pokemon.where('pokemon_name LIKE ?', wildcard_search)
    end
end
