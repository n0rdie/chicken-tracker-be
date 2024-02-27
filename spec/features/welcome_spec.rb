require 'rails_helper'

RSpec.describe "Welcome Page" do
    it "has shelters index button" do
        visit "/"
        expect(page).to have_content("Welcome")
        expect(page).to have_button("Shelters Index")
    end
end