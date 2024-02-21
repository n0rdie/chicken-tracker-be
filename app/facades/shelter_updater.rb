class ShelterUpdater
    def self.update(shelter_id, shelter_params)
        shelter = Shelter.find_by(id: shelter_id)

        if shelter == nil #fail
            return { json: { error: "Shelter not found" }, status: :not_found }
        elsif shelter.update(shelter_params) #success
            return { json: ShelterSerializer.new(shelter), status: :ok }
        else #fail
            return { json: { message: "Shelter update failed" }, status: :unprocessable_entity }
        end
    end
end