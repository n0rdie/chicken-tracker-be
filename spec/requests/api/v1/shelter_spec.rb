require "rails_helper"

RSpec.describe "Api::V1::Shelters", type: :request do
    it "15: Shelter Index" do
        shelter3_data = ({ "name": "Green Sea", "user_id": "2" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: shelter3_data)

        shelter1_data = ({ "name": "Red Barn", "user_id": "1" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: shelter1_data)

        shelter2_data = ({ "name": "Blue Coop", "user_id": "1" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: shelter2_data)

        # When a GET Shelters is sent
        user_data = ({ "user_id": "1" })
        get "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}
        expect(response).to have_http_status(:success)
        # All Shelters data are returned
        json_response = JSON.parse(response.body)
        expect(json_response['data'][0]['attributes']['name']).to eq('Green Sea')
        expect(json_response['data'][0]['attributes']['user_id']).to eq(2)
        expect(json_response['data'][1]['attributes']['name']).to eq('Red Barn')
        expect(json_response['data'][1]['attributes']['user_id']).to eq(1)
        expect(json_response['data'][2]['attributes']['name']).to eq('Blue Coop')
        expect(json_response['data'][2]['attributes']['user_id']).to eq(1)
        expect(json_response['data'].count).to eq(3)

        # When a GET Shelters is sent with a valid User_id
        get "/api/v1/shelters?user_id=1", headers: {"CONTENT_TYPE" => "application/json"}
        expect(response).to have_http_status(:success)
        # All Shelters of that User_id are returned
        json_response = JSON.parse(response.body)
        expect(json_response['data'][0]['attributes']['name']).to eq('Red Barn')
        expect(json_response['data'][1]['attributes']['name']).to eq('Blue Coop')
        # And Shelters not of that User_id are not returned
        expect(json_response['data'].count).to eq(2)
    end

    it "14: Shelter Show" do
        new_shelter_data = ({ "name": "Red Barn", "user_id": "1" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)
        shelter = Shelter.last

        new_animal_data = ({ "shelter_id": shelter.id, "name": "Huck", "species": "Chicken", "top_speed": "30 mph" })
        post "/api/v1/shelters/#{shelter.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: new_animal_data)
        animal = Animal.last

        # When a GET Shelter is sent with a valid :id
        get "/api/v1/shelters/#{shelter.id}", headers: {"CONTENT_TYPE" => "application/json"}
        expect(response).to have_http_status(:success)
        # The Shelter's data is returned
        json_response = JSON.parse(response.body)

        expect(json_response['data']['id']).to eq(shelter.id.to_s)
        expect(json_response['data']['type']).to eq('shelter')
        expect(json_response['data']['attributes']['name']).to eq('Red Barn')
        expect(json_response['data']['relationships']['animals']['data'][0]['id'].to_i).to eq(animal.id)
    end

    it "7: Shelter Create" do
        original_num_shelters = Shelter.all.count

        # When a POST Shelter is sent with correct information
        new_shelter_data = ({
            "name": "Red Barn",
            "user_id": "1"
        })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)

        # A new Shelter is created and saved
        expect(response).to have_http_status(:success)
        expect(Shelter.all.count).to eq(original_num_shelters+1)

        # And the new Shelter has all the info sent with post
        expect(Shelter.last.name).to eq("Red Barn")
        expect(Shelter.last.user_id).to eq(1)
    end

    it "8: Shelter Update" do
        new_shelter_data = ({ "name": "Red Barn", "user_id": "1" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)
        shelter = Shelter.last
        original_num_shelters = Shelter.all.count

        # When a PATCH Shelter is sent with correct information
        update_shelter_data = ({ "name": "Blue Coop" })
        patch "/api/v1/shelters/#{shelter.id}", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: update_shelter_data)
        # The Shelter is updated and saved
        expect(response).to have_http_status(:success)
        expect(Shelter.all.count).to eq(original_num_shelters)
        # And the new Shelter has all the info sent with PATCH
        expect(Shelter.last.name).to eq("Blue Coop")
    end

    it "12: Shelter Destroy" do
        new_shelter_data = ({ "name": "Red Barn", "user_id": "1" })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)
        shelter = Shelter.last
        new_animal_data = ({ "shelter_id": Shelter.last.id, "name": "Huck", "species": "Chicken", "birthday": nil, "color": nil, "diet": nil, "top_speed": nil })
        post "/api/v1/shelters/#{Shelter.last.id}/animals", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(animal: new_animal_data)
        original_num_animals = Animal.all.count
        original_num_shelters = Shelter.all.count

        # When a DELETE Shelter is sent with a valid :id
        delete "/api/v1/shelters/#{shelter.id}", headers: {"CONTENT_TYPE" => "application/json"}
        # The Shelter is deleted
        expect(response).to have_http_status(:success)
        expect(Shelter.all.count).to eq(original_num_shelters-1)
        update_shelter_data = ({ "name": "Blue Coop", "user_id": "1" })
        patch "/api/v1/shelters/#{shelter.id}", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: update_shelter_data)
        expect(response).to have_http_status(:not_found)
        # And all the Animals in the Shelter are also deleted
        expect(Animal.all.count).to eq(original_num_animals-1)
    end
end