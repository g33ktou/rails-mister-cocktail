require "open-uri"
require "json"
require "faker"
Ingredient.destroy_all

#Ingredient.create!(name: "coca")

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ing_list = JSON.parse(open(url).read)["drinks"]

ing_list.each do |ing_hash|
  p "creating ingredient :#{ing_hash["strIngredient1"]}"
  Ingredient.create!(name: ing_hash["strIngredient1"])
end

10.times do
  cocktail = Cocktail.new(
    name: Faker::DragonBall.character
    )
  cocktail.save
end

