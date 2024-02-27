require 'rails_helper'

RSpec.describe 'AnimalFacade' do 
  it '#get animal search' do
    json_response = File.read("spec/fixtures/chicken_fixture.json")
    stub_request(:get, "https://api.api-ninjas.com/v1/animals?name=Chicken").
    to_return(status: 200, body: json_response, headers: {})

    search_term = 'Chicken' 

    animal = AnimalFacade.animal_search(search_term)

    expect(animal).to be_a(AnimalPoro)
    expect(animal.name).to eq('')
    expect(animal.species).to eq("Chicken")
    expect(animal.birthday).to eq('')
    expect(animal.color).to eq('')
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