# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
chicken_1 = Animal.create!(
  name: "Tom", 
  species: "chicken", 
  birthday: Date.new(2023,3,3), 
  color: "orange", 
  main_prey: "Seeds, Fruit, Insects, Berries",
  habitat: "Open woodland and sheltered grassland"
  diet: "Omnivore"
  skin_type: "Feathers"
  top_speed: "6 mph"
  avg_litter: "2"
  lifespan: "2 - 4 years"
  weight: "1kg - 3kg (2.2lbs - 6.6lbs)"
  lifestyle: "Flock"
  fav_food: "Seeds"
  shelter_id: "1"
  )

chicken_2 = Animal.create!(
  name: "Bubba", 
  species: "chicken", 
  birthday: Date.new(2022,2,2), 
  color: "black", 
  main_prey: "Seeds, Fruit, Insects, Berries",
  habitat: "Open woodland and sheltered grassland"
  diet: "Omnivore"
  skin_type: "Feathers"
  top_speed: "6 mph"
  avg_litter: "2"
  lifespan: "2 - 4 years"
  weight: "1kg - 3kg (2.2lbs - 6.6lbs)"
  lifestyle: "Flock"
  fav_food: "Seeds"
  shelter_id: "1"
  )

chicken_3 = Animal.create!(
  name: "Helena", 
  species: "chicken", 
  birthday: Date.new(2021,11,11), 
  color: "reddish-orange", 
  main_prey: "Seeds, Fruit, Insects, Berries",
  habitat: "Open woodland and sheltered grassland"
  diet: "Omnivore"
  skin_type: "Feathers"
  top_speed: "6 mph"
  avg_litter: "2"
  lifespan: "2 - 4 years"
  weight: "1kg - 3kg (2.2lbs - 6.6lbs)"
  lifestyle: "Flock"
  fav_food: "Seeds"
  shelter_id: "1"
  )

chicken_4 = Animal.create!(
  name: "Barbara", 
  species: "chicken", 
  birthday: Date.new(2020,4,7), 
  color: "black", 
  main_prey: "Seeds, Fruit, Insects, Berries",
  habitat: "Open woodland and sheltered grassland"
  diet: "Omnivore"
  skin_type: "Feathers"
  top_speed: "6 mph"
  avg_litter: "2"
  lifespan: "2 - 4 years"
  weight: "1kg - 3kg (2.2lbs - 6.6lbs)"
  lifestyle: "Flock"
  fav_food: "Seeds"
  shelter_id: "1"
  )

chicken_5 = Animal.create!(
  name: "Emma", 
  species: "chicken", 
  birthday: Date.new(2023,5,5), 
  color: "green", 
  main_prey: "Seeds, Fruit, Insects, Berries",
  habitat: "Open woodland and sheltered grassland"
  diet: "Omnivore"
  skin_type: "Feathers"
  top_speed: "6 mph"
  avg_litter: "2"
  lifespan: "2 - 4 years"
  weight: "1kg - 3kg (2.2lbs - 6.6lbs)"
  lifestyle: "Flock"
  fav_food: "Seeds"
  shelter_id: "1"
  )