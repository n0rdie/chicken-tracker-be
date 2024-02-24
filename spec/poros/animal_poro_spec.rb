require 'rails_helper'

RSpec.describe AnimalPoro do
  it 'creates an animal poro based on attributes' do
    attr = {
      "name": "Chicken",
      "characteristics": {
          "main_prey": "Seeds, Fruit, Insects, Berries",
          "distinctive_feature": "Sharp, pointed beak and clucking sounds",
          "wingspan": "45cm - 60cm (17.7in - 23.6in)",
          "habitat": "Open woodland and sheltered grassland",
          "predators": "Human, Fox, Raccoon",
          "diet": "Omnivore",
          "lifestyle": "Flock",
          "favorite_food": "Seeds",
          "type": "Bird",
          "average_clutch_size": "2",
          "slogan": "First domesticated more than 10,000 years ago!",
          "color": "BrownYellowRedBlackWhiteOrange",
          "skin_type": "Feathers",
          "top_speed": "6 mph",
          "lifespan": "2 - 4 years",
          "weight": "1kg - 3kg (2.2lbs - 6.6lbs)",
          "length": "30cm - 45cm (11.8in - 17.7in)"
      }
    }

    animal = AnimalPoro.new(attr)
    expect(animal).to be_a(AnimalPoro)
    expect(animal.name).to eq('Chicken')
    expect(animal.species).to eq('Bird')
    expect(animal.birthday).to eq('')
    expect(animal.color).to eq('BrownYellowRedBlackWhiteOrange')
    expect(animal.main_prey).to eq('Seeds, Fruit, Insects, Berries')
    expect(animal.habitat).to eq('Open woodland and sheltered grassland')
    expect(animal.lifespan).to eq('2 - 4 years')
    expect(animal.lifestyle).to eq('Flock')
    expect(animal.diet).to eq('Omnivore')
    expect(animal.skin_type).to eq('Feathers')
    expect(animal.top_speed).to eq('6 mph')
    expect(animal.avg_litter).to eq('2')
    expect(animal.weight).to eq('1kg - 3kg (2.2lbs - 6.6lbs)')
    expect(animal.fav_food).to eq('Seeds')
  end
end