class Api::V1::SheltersController < ApplicationController

    def index 
      shelters = Shelter.where(user_id: params[:user_id])
      render json: ShelterSerializer.new(shelters)
    end

    def show
        shelter = Shelter.find(params[:id])
        render json: ShelterSerializer.new(shelter)
    end

    def create
        shelter = Shelter.create(shelter_params)
        if shelter.save
            render json: ShelterSerializer.new(shelter)
        else

        end
    end

    def update
        result = ShelterUpdater.update(params[:id], shelter_params)
        render result
    end

    def destroy
        ShelterDestroyer.destroy(params[:id])
    end

    private

    def shelter_params
        params.require(:shelter).permit(:id, :name, :user_id)
    end
end