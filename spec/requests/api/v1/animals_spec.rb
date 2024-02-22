require "rails_helper"

RSpec.describe "Api::V1::Shelters", type: :request do
    it "9: Animal Create" do
        new_shelter_data = ({ "name": "Red Barn" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)
        shelter = Shelter.last

        original_num_animals = Animal.all.count

        # When a POST Animal is sent with correct information
        new_animal_data = ({
            "shelter_id": shelter.id,
            "name": "Huck",
            "species": "Chicken",
            "birthday": nil,
            "color": nil,
            "slogan": nil,
            "diet": nil,
            "speed": nil
        })
        post "/api/v1/shelters/#{shelter.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: new_animal_data)
        
        # A new Animal is created and saved
        expect(response).to have_http_status(:success)
        expect(Animal.all.count).to eq(original_num_animals+1)

        # And the new Animal has all the info sent with post
        expect(Animal.last.name).to eq("Huck")
        expect(Animal.last.species).to eq("Chicken")
        expect(Animal.last.speed).to eq(nil)

        # And you can get the Animal from its Shelter
        expect(shelter.animals).to eq([Animal.last])
    end

    it "10: Animal Update" do
        new_shelter_data = ({ "name": "Red Barn" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)
        shelter = Shelter.last
        new_animal_data = ({ "shelter_id": shelter.id, "name": "Huck", "species": "Chicken", "birthday": nil, "color": nil, "slogan": nil, "diet": nil, "speed": nil })
        post "/api/v1/shelters/#{shelter.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: new_animal_data)
        animal = Animal.last
        original_num_animals = Animal.all.count

        # When a PATCH Animal is sent with correct information
        update_animal_data = ({
            "shelter_id": shelter.id,
            "name": "Chuck",
            "species": "Chicken",
            "birthday": nil,
            "color": nil,
            "slogan": nil,
            "diet": nil,
            "speed": "30 mph"
        })
        patch "/api/v1/shelters/#{shelter.id}/animals/#{animal.id}", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: update_animal_data)

        # The Shelter is updated and saved
        expect(response).to have_http_status(:success)
        expect(Animal.all.count).to eq(original_num_animals)

        # And the new Shelter has all the info sent with PATCH
        expect(Animal.last.name).to eq("Chuck")
        expect(Animal.last.name).to_not eq("Huck")
        expect(Animal.last.species).to eq("Chicken")
        expect(Animal.last.speed).to_not eq(nil)
        expect(Animal.last.speed).to eq("30 mph")
    end

    it "11: Animal Destroy" do
        new_shelter_data = ({ "name": "Red Barn" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)
        new_animal_data = ({ "shelter_id": Shelter.last.id, "name": "Huck", "species": "Chicken", "birthday": nil, "color": nil, "slogan": nil, "diet": nil, "speed": nil })
        post "/api/v1/shelters/#{Shelter.last.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: new_animal_data)
        animal = Animal.last
        original_num_animals = Animal.all.count

        # When a DELETE Animal is sent with a valid :id
        delete "/api/v1/shelters/#{Shelter.last.id}/animals/#{animal.id}", headers: {"CONTENT_TYPE" => "application/json"}
        # The Animal is deleted
        expect(response).to have_http_status(:success)
        expect(Animal.all.count).to eq(original_num_animals-1)
        get "/api/v1/shelters/#{Shelter.last.id}/animals/#{animal.id}", headers: {"CONTENT_TYPE" => "application/json"}
        expect(response).to have_http_status(:not_found)
        # And the Animal's Shelter does not have the Animal
        expect(Shelter.last.animals).to eq([])
    end
end