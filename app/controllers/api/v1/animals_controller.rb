class Api::V1::AnimalsController < ApplicationController
    def create
        animal = Animal.create(animal_params)
        if animal.save
            render json: AnimalSerializer.new(animal)
        else

        end
    end

    def update
        result = AnimalUpdater.update(params[:id], animal_params)
        render result
    end

    private

    def animal_params
        params.require(:animal).permit(:id, :shelter_id, :name, :species, :birthday, :color, :slogan, :diet, :speed)
    end
end