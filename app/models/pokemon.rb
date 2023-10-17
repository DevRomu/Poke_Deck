class Pokemon < ApplicationRecord
  has_many :pokemon_moves
  has_many :moves, through: :pokemon_moves
  has_many :pokemon_types
  has_many :types, through: :pokemon_types

  validates :pokemon_name, :image_url, :hp, :attack, :defense, :spatk, :spdef, :speed, presence: true
  validates :pokemon_name, :image_url, uniqueness: true
  validates :hp, :attack, :defense, :spatk, :spdef, :speed, numericality: {only_integer: true, greater_than: 0}
end
