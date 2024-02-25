class ShelterUpdater
    def self.update(shelter_id, shelter_params)
        
        if shelter_params[:shelter_id]
            return unless shelter = Shelter.find_by(id: shelter_id)
        end

        ShelterSerializer.new(Shelter.update!(shelter_id, shelter_params))

    end
end