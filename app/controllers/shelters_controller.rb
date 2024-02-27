class SheltersController < ApplicationController
    def show
        @shelter = Shelter.find(params[:id])
    end

    def index
        @shelters = Shelter.all
    end
end