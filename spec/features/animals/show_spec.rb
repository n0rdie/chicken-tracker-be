require "rails_helper"

RSpec.describe "Shelters", type: :feature do
    before(:each) do
        @shelter1 = Shelter.create(name: 'Red Barn', user_id: 5641)
        @animal1 = @shelter1.animals.create(name: 'Huck', 
                                            species: 'Chicken',
                                            birthday: 'May 6',
                                            color: 'red',
                                            habitat: 'outside',
                                            diet: 'kfc',
                                            skin_type: 'feathers',
                                            top_speed: '5',
                                            avg_litter: '0',
                                            lifespan: 'Forever',
                                            weight: 'Nikocado',
                                            lifestyle: 'lazy',
                                            fav_food: 'French Fries',
                                            )
    end

    it "Animal Show" do
        visit "/shelters/#{@shelter1.id}/animals/#{@animal1.id}"
        expect(page).to have_link('Red Barn')
        expect(page).to have_content('Huck')
        expect(page).to have_content('Chicken')
        expect(page).to have_content('May 6')
        expect(page).to have_content('Red')
        expect(page).to have_content('outside')
        expect(page).to have_content('kfc')
        expect(page).to have_content('feathers')
        expect(page).to have_content('5')
        expect(page).to have_content('0')
        expect(page).to have_content('Forever')
        expect(page).to have_content('Nikocado')
        expect(page).to have_content('lazy')
        expect(page).to have_content('French Fries')
        
        click_on('Red Barn')
        expect(current_path).to eq("/shelters/#{@shelter1.id}")
    end
end