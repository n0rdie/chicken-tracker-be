require "rails_helper"

RSpec.describe "Animals", type: :feature do
    before(:each) do
        @shelter1 = Shelter.create(name: 'Red Barn', user_id: 5641)
        @animal1 = @shelter1.animals.create(name: 'Huck', species: 'Chicken')
        @animal2 = @shelter1.animals.create(name: 'Todd', species: 'Chicken')

        @shelter2 = Shelter.create(name: 'Blue Coop', user_id: 5641)
        @animal3 = @shelter2.animals.create(name: 'Bob', species: 'Chicken')
    end

    it "Animal Index" do
        visit "/shelters/#{@shelter1.id}/animals"
        expect(page)to have_content('Red Barn')
        expect(page).to have_link('Huck')
        expect(page).to have_link('Todd')
        expect(page).to_not have_link('Bob')

        click_on('Huck')
        expect(current_path).to eq("/shelters/#{@shelter1.id}/animals/#{@animal1.id}")
    end
end