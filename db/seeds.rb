# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#   https://pokeapi.co/api/v2/pokemon/ - Pokemon API

require 'net/http'
require 'json'

url = URI("https://pokeapi.co/api/v2/pokemon/")
response = Net::HTTP.get(url)
json_data = JSON.parse(response)

# iteraate through JSON data and create records in the database
json_data["results"].each do |pokemon|
  # create a new record in the database
  Pokemon.create(name: pokemon["name"], url: pokemon["url"])
end
