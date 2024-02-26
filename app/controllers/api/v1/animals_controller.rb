class Api::V1::AnimalsController < ApplicationController
    
    def show
        render json: AnimalSerializer.new(Animal.find_by(id: params[:id])) 
    end

    def index
        shelter = Shelter.find(params[:shelter_id])
        render json: AnimalSerializer.new(shelter.animals)
    end

    def create
        animal = AnimalFacade.animal_search(params[:q]) # External Ninja
        animal = Animal.create(animal) # Creation BE
        animal.save! # Save to BE table
        render json: AnimalSerializer.new(animal) # pass to frontend Json
    end

    def update
        result = AnimalUpdater.update(params[:id], animal_params)
        render result
    end

    def destroy
        AnimalDestroyer.destroy(params[:id])
    end

private

    def animal_params
        params.require(:animal).permit( :id, 
                                        :shelter_id, 
                                        :name, 
                                        :species, 
                                        :birthday, 
                                        :color, 
                                        :main_prey, 
                                        :habitat, 
                                        :diet, 
                                        :skin_type, 
                                        :top_speed, 
                                        :avg_litter, 
                                        :lifespan, 
                                        :weight, 
                                        :lifestyle, 
                                        :fav_food
        )
    end
end