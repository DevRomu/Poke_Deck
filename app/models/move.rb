class Move < ApplicationRecord
  has_many :pokemon_moves
  has_many :pokemons, through: :pokemon_moves

  validates :move_name, presence: true
  validates :move_name, uniqueness: true
  validates :power, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 250}
  validates :accuracy, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 100}
end
