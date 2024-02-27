require "rails_helper"

RSpec.describe "Shelters", type: :feature do
    before(:each) do
        @shelter1 = Shelter.create(name: 'Red Barn', user_id: 1)
        @animal1 = @shelter1.animals.create(name: 'Huck', species: 'Chicken')
        @animal2 = @shelter1.animals.create(name: 'Todd', species: 'Chicken')
    end

    it "Shelter Show" do
        visit "/shelters/#{@shelter1.id}"
        expect(page).to have_content('Red Barn')
        expect(page).to have_link('Huck')
        expect(page).to have_link('Todd')
        expect(page).to have_button('Back to Shelter Index')
    end
end