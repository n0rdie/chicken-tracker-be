require 'rails_helper'

RSpec.describe 'Animal Service' do
  it 'searches our API for an animal' do
    search_term = 'Chicken' 
    animals = AnimalService.new.animal(search_term)

    expect(animals).to be_a(Array)

    animal = animals[0]
    expect(animal).to be_a(Object)

    expect(animal[:name]).to be_a(String)
    expect(animal[:name]).to eq('Chicken')

    expect(animal[:characteristics][:type]).to be_a(String)
    expect(animal[:characteristics][:type]).to eq('Bird')

    expect(animal[:characteristics][:color]).to be_a(String)
    expect(animal[:characteristics][:color]).to eq('BrownYellowRedBlackWhiteOrange')

    expect(animal[:characteristics][:main_prey]).to be_a(String)
    expect(animal[:characteristics][:main_prey]).to eq('Seeds, Fruit, Insects, Berries')

    expect(animal[:characteristics][:habitat]).to be_a(String)
    expect(animal[:characteristics][:habitat]).to eq('Open woodland and sheltered grassland')

    expect(animal[:characteristics][:lifespan]).to be_a(String)
    expect(animal[:characteristics][:lifespan]).to eq('2 - 4 years')

    expect(animal[:characteristics][:lifestyle]).to be_a(String)
    expect(animal[:characteristics][:lifestyle]).to eq('Flock')

    expect(animal[:characteristics][:diet]).to be_a(String)
    expect(animal[:characteristics][:diet]).to eq('Omnivore')

    expect(animal[:characteristics][:skin_type]).to be_a(String)
    expect(animal[:characteristics][:skin_type]).to eq('Feathers')

    expect(animal[:characteristics][:top_speed]).to be_a(String)
    expect(animal[:characteristics][:top_speed]).to eq('6 mph')

    expect(animal[:characteristics][:average_clutch_size]).to be_a(String)
    expect(animal[:characteristics][:average_clutch_size]).to eq('2')

    expect(animal[:characteristics][:weight]).to be_a(String)
    expect(animal[:characteristics][:weight]).to eq('1kg - 3kg (2.2lbs - 6.6lbs)')

    expect(animal[:characteristics][:favorite_food]).to be_a(String)
    expect(animal[:characteristics][:favorite_food]).to eq('Seeds')
  end
end