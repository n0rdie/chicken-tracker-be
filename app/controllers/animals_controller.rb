class AnimalsController < ApplicationController
    def show
        @animal = Animal.find(params[:id])
    end

    def index
        @animals = Animal.all
    end
end