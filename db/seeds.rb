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



# iterate through JSON data and create records in the database
json_data["results"].each do |pokemon|

  url2 = URI(pokemon["url"])
  response2 = Net::HTTP.get(url2)
  json_data2 = JSON.parse(response2)

  # create a new record in the database
  Pokemon.create(
    name:      pokemon["name"],
    image_url: json_data2["sprites"]["front_default"],
    hp:        json_data2["stats"][0]["base_stat"],
    attack:    json_data2["stats"][1]["base_stat"],
    defense:   json_data2["stats"][2]["base_stat"],
    spatk:     json_data2["stats"][3]["base_stat"],
    spdef:     json_data2["stats"][4]["base_stat"],
    speed:     json_data2["stats"][5]["base_stat"]
  )
end
