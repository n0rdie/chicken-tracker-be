require "rails_helper"

RSpec.describe "Shelters", type: :feature do
    before(:each) do
        @shelter1 = Shelter.create(name: 'Red Barn', user_id: 5641)
        @shelter2 = Shelter.create(name: 'Blue Coop', user_id: 483920)
        @shelter3 = Shelter.create(name: 'Green Sea', user_id: 6483)
    end

    it "Shelter Index" do
        visit "/shelters"
        expect(page).to have_link('Red Barn')
        expect(page).to have_link('Blue Coop')
        expect(page).to have_link('Green Sea')

        click_on('Red Barn')
        expect(current_path).to eq("/shelters/#{@shelter1.id}")
    end
end