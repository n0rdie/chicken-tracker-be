class Api::V1::SheltersController < ApplicationController

    def index
        if params[:user_id]
            render json: ShelterSerializer.new(Shelter.where("user_id = #{params[:user_id]}"))
        else
            render json: ShelterSerializer.new(Shelter.all)
        end
    end

  
  
  # def index 

  #   shelters = Shelter.where(user_id: params[:user_id])
  #   render json: ShelterSerializer.new(shelters)
  #   # require "pry"; binding.pry

  # end
  
  def show
        shelter = Shelter.find(params[:id])
        render json: ShelterSerializer.new(shelter)
    end

    def create
        shelter = Shelter.create(shelter_params)
        shelter.save!
        render json: ShelterSerializer.new(shelter)
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