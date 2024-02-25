class Api::V1::AnimalsController < ApplicationController
    
    def show
        animal = AnimalFacade.animal_search(params[:q])
        render json: AnimalSerializer.new(animal)
    end

    def index
        shelter = Shelter.find(params[:shelter_id])
        render json: AnimalSerializer.new(shelter.animals)
    end

    def create
        animal = Animal.create(animal_params)
        animal.save!
        render json: AnimalSerializer.new(animal)
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

    def no_animal_response
      render json: ErrorSerializer.new(
      ErrorMessage.new(
        "The requested animal could not be found.", 404
      )).serialize_json, status: 404
    end
end