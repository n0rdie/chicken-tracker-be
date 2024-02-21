class Api::V1::SheltersController < ApplicationController
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

    private

    def shelter_params
        params.require(:shelter).permit(:id, :name)
    end
end