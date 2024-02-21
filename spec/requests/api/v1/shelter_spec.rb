require "rails_helper"

RSpec.describe "Api::V1::Shelters", type: :request do
    it "7: Shelter Create" do
        original_num_shelters = Shelter.all.count

        # When a POST Shelter is sent with correct information
        new_shelter_data = ({
            "name": "Red Barn"
        })
        post "/api/v1/shelters", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(shelter: new_shelter_data)

        # A new Shelter is created and saved
        expect(response).to have_http_status(:success)
        expect(Shelter.all.count).to eq(original_num_shelters+1)

        # And the new Shelter has all the info sent with post
        expect(Shelter.last.name).to eq("Red Barn")
    end

    it "8: Shelter Update" do
        new_shelter_data = ({ "name": "Red Barn" })
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
end