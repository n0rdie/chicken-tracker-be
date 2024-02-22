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