require "rails_helper"

RSpec.describe "Api::V1::Users", type: :request do
    it "2: Sign Up" do
        original_num_users = User.all.count

        # When a POST User is sent with correct information
        new_user_data = ({
            "name": "Issac's dad",
            "password_digest": "qwertyuiop123"
        })
        post "/api/v1/users", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(user: new_user_data)

        # A new User is created and saved
        expect(response).to have_http_status(:success)
        expect(User.all.count).to eq(original_num_users+1)

        # And the new User has all the info sent with post
        expect(User.last.name).to eq("Issac's dad")

        # And the password is encrypted
    end
end