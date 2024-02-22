class AnimalUpdater
    def self.update(animal_id, animal_params)
        animal = Animal.find_by(id: animal_id)

        if animal == nil #fail
            return { json: { error: "Animal not found" }, status: :not_found }
        elsif animal.update(animal_params) #success
            animal.save
            animal.update(animal_params)
            return { json: AnimalSerializer.new(animal), status: :ok }
        else #fail
            return { json: { message: "Animal update failed" }, status: :unprocessable_entity }
        end
    end
end