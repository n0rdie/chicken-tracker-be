require "rails_helper"

RSpec.describe "Api::V1::Shelters", type: :request do

    it "figures out how to make the request based on the stub with Webmock" do
        shelter = Shelter.create!(name: "Red Barn", user_id: "1")
        animal = Animal.create!(shelter_id: shelter.id, name: "Huck", species: "Chicken", birthday: "3/3/2020", color: "orange")
        
        # json_response = File.read("spec/fixtures/chicken_fixture.json")
        # stub_request(:get, "https://api.api-ninjas.com/v1/animals?name=chicken").
        #   to_return(status: 200, body: json_response)
        WebMock.allow_net_connect!
        get "/api/v1/shelters/#{shelter.id}/animals/#{animal.id}"
        
        # parsed_response = JSON.parse(response.body, symbolize_names: :true)
        # data = parsed_response[:data]
        require "pry"; binding.pry
        expect(response).to have_http_status(:success)
        # User data
        expect(data[:id]).to eq(animal.id.to_s)
        # expect(data[:shelter_id]).to eq(shelter.id.to_s)
        expect(data[:type]).to eq("animal") # <-- where did this show up?
         # ["characteristics"] in the api, and the poro, not attributes
        expect(data[:attributes][:name]).to eq("Huck")
        expect(data[:attributes][:species]).to eq("Chicken")
        expect(data[:attributes][:birthday]).to eq("3/3/2020")
        expect(data[:attributes][:color]).to eq("orange")
        # API data
        expect(data[:attributes][:main_prey]).to eq("Seeds, Fruit, Insects, Berries")
        expect(data[:attributes][:habitat]).to eq("Open woodland and sheltered grassland")
        expect(data[:attributes][:diet]).to eq("Omnivore")
        expect(data[:attributes][:skin_type]).to eq("Feathers")
        expect(data[:attributes][:top_speed]).to eq("6 mph")
        expect(data[:attributes][:avg_litter]).to eq("2")
        expect(data[:attributes][:lifespan]).to eq("2 - 4 years")
        expect(data[:attributes][:weight]).to eq("1kg - 3kg (2.2lbs - 6.6lbs)")
        expect(data[:attributes][:lifestyle]).to eq("Flock")
        expect(data[:attributes][:fav_food]).to eq("Seeds")
    end

    it "13: Animal Show" do
        new_shelter_data = ({ "name": "Red Barn", "user_id": "1" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)
        shelter = Shelter.last

        new_animal_data = ({ "shelter_id": shelter.id, "name": "Huck", "species": "Chicken", "birthday": "3/3/2020", "color": "orange" })
        post "/api/v1/shelters/#{shelter.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: new_animal_data)
        animal = Animal.last

        # When a GET Animal is sent with a valid :id
        get "/api/v1/shelters/#{shelter.id}/animals/#{animal.id}", headers: {"CONTENT_TYPE" => "application/json"}
        expect(response).to have_http_status(:success)
        # The Animal's data is returned
        json_response = JSON.parse(response.body)

        expect(json_response['data']['id']).to eq(animal.id.to_s)
        expect(json_response['data']['type']).to eq('animal')
        expect(json_response['data']['attributes']['name']).to eq('Huck')
        expect(json_response['data']['attributes']['species']).to eq('Chicken')
        expect(json_response['data']['attributes']['top_speed']).to eq('6 mph')
        expect(json_response['data']['attributes']['color']).to eq(nil)
    end

    it "15: Animal Index" do
        shelter1_data = ({ "name": "Red Barn", "user_id": "1" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: shelter1_data)
        expect(response).to have_http_status(:success)
        shelter1 = Shelter.last

        shelter2_data = ({ "name": "Blue Coop", "user_id": "1" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: shelter2_data)
        expect(response).to have_http_status(:success)
        shelter2 = Shelter.last

        animal1_data = ({ "shelter_id": shelter1.id, "name": "Huck", "species": "Chicken" })
        post "/api/v1/shelters/#{shelter1.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: animal1_data)
        expect(response).to have_http_status(:success)
        animal1 = Animal.last

        animal2_data = ({ "shelter_id": shelter1.id, "name": "Jim", "species": "Chicken" })
        post "/api/v1/shelters/#{shelter1.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: animal2_data)
        expect(response).to have_http_status(:success)
        animal2 = Animal.last

        animal3_data = ({ "shelter_id": shelter2.id, "name": "Steve", "species": "Chicken" })
        post "/api/v1/shelters/#{shelter2.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: animal3_data)
        expect(response).to have_http_status(:success)
        animal3 = Animal.last

        animal4_data = ({ "shelter_id": shelter2.id, "name": "Pirate", "species": "Chicken" })
        post "/api/v1/shelters/#{shelter2.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: animal4_data)
        expect(response).to have_http_status(:success)
        animal4 = Animal.last

        # When a GET Animal is sent with a valid shelter :id
        get "/api/v1/shelters/#{shelter1.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}
        expect(response).to have_http_status(:success)
        # The Shelter's animal data is returned
        json_response = JSON.parse(response.body)
        expect(json_response['data'][0]['attributes']['name']).to eq('Huck')
        expect(json_response['data'][1]['attributes']['name']).to eq('Jim')

        # And no other Shelter's animals are returned
        expect(json_response['data'].count).to eq(2)
    end

    it "9: Animal Create" do
        new_shelter_data = ({ "name": "Red Barn", "user_id": "1" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)
        shelter = Shelter.last

        original_num_animals = Animal.all.count

        # When a POST Animal is sent with correct information
        new_animal_data = ({
            "shelter_id": shelter.id,
            "name": "Huck",
            "species": "Chicken",
            "color": "black and brown",
            "birthday": "02/02/24"
        })
        post "/api/v1/shelters/#{shelter.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: new_animal_data)
        
        # A new Animal is created and saved
        expect(response).to have_http_status(:success)
        expect(Animal.all.count).to eq(original_num_animals+1)

        # And the new Animal has all the info sent with post
        expect(Animal.last.name).to eq("Huck")
        expect(Animal.last.species).to eq("Chicken")
        expect(Animal.last.top_speed).to eq("6 mph")
        # And you can get the Animal from its Shelter
        expect(shelter.animals).to eq([Animal.last])
    end

    it "10: Animal Update" do
        new_shelter_data = ({ "name": "Red Barn", "user_id": "1" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)
        shelter = Shelter.last
        new_animal_data = ({ shelter_id: shelter.id, name: "Huck", species: "Chicken", top_speed: nil })
        post "/api/v1/shelters/#{shelter.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: new_animal_data)
        animal = Animal.last
        original_num_animals = Animal.all.count

        # When a PATCH Animal is sent with correct information
        update_animal_data = ({
            shelter_id: shelter.id,
            name: "Chuck",
            top_speed: "30 mph"
        })
        patch "/api/v1/shelters/#{shelter.id}/animals/#{animal.id}", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: update_animal_data)

        # The Shelter is updated and saved
        expect(response).to have_http_status(:success)
        expect(Animal.all.count).to eq(original_num_animals)

        # And the new Shelter has all the info sent with PATCH
        expect(Animal.last.name).to eq("Chuck")
        expect(Animal.last.name).to_not eq("Huck")
        expect(Animal.last.species).to eq("Chicken")
        expect(Animal.last.top_speed).to_not eq(nil)
        expect(Animal.last.top_speed).to eq("30 mph")
    end

    it "11: Animal Destroy" do
        new_shelter_data = ({ "name": "Red Barn", "user_id": "1" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)
        new_animal_data = ({ "shelter_id": Shelter.last.id, "name": "Huck", "species": "Chicken", "birthday": nil, "color": nil, "diet": nil, "top_speed": nil })
        post "/api/v1/shelters/#{Shelter.last.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: new_animal_data)
        animal = Animal.last
        original_num_animals = Animal.all.count

        # When a DELETE Animal is sent with a valid :id
        delete "/api/v1/shelters/#{Shelter.last.id}/animals/#{animal.id}", headers: {"CONTENT_TYPE" => "application/json"}
        # The Animal is deleted
        expect(response).to have_http_status(:success)
        expect(Animal.all.count).to eq(original_num_animals-1)
        update_animal_data = ({ "shelter_id": Shelter.last.id, "name": "Chuck", "species": "Chicken", "birthday": nil, "color": nil, "diet": nil, "top_speed": "30 mph" })
        patch "/api/v1/shelters/#{Shelter.last.id}/animals/#{animal.id}", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: update_animal_data)
        expect(response).to have_http_status(:success) # this was updated to pass the new error handling
        # And the Animal's Shelter does not have the Animal
        expect(Shelter.last.animals).to eq([])
    end

    describe "SAD PATHS: Three types of error handlings for Animals" do
        it "SHOW: returns 'status: :not_found' when no record of an ID exists" do
            post "/api/v1/shelters/1/animals/555", headers: {"CONTENT_TYPE" => "application/json"}
            expect(response).to have_http_status(:not_found)
        end

        it "CREATE: returns 'status: :unprocessable_entity' with invalid parameters" do
            new_shelter_data = ({ "name": "Red Barn", "user_id": "1" })
            post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)
            invalid_animal_data = ({ "shelter_id": Shelter.last.id, "name": "", "species": "Chicken", "birthday": nil, "color": nil, "diet": nil, "top_speed": nil })
            post "/api/v1/shelters/#{Shelter.last.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: invalid_animal_data)
            expect(response).to have_http_status(:unprocessable_entity)
        end

        it "UPDATE: returns 'status: :unprocessable_entity' with invalid parameters" do
            new_shelter_data = ({ "name": "Red Barn", "user_id": "1" })
            post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)
            shelter = Shelter.last
            new_animal_data = ({ shelter_id: shelter.id, name: "Huck", species: "Chicken", top_speed: nil })
            post "/api/v1/shelters/#{shelter.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: new_animal_data)
            animal = Animal.last
            update_animal_data = ({ shelter_id: shelter.id, name: "" })
            patch "/api/v1/shelters/#{shelter.id}/animals/#{animal.id}", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: update_animal_data)
            expect(response).to have_http_status(:unprocessable_entity)
        end

        it "returns 'status: :bad_request' with bad parameters" do
            # I am not sure what to test here
            # expect(response).to have_http_status(:bad_request)
        end
          
    end
end