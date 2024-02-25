class AnimalUpdater
    def self.update(animal_id, animal_params)
        
        if animal_params[:shelter_id]
            return unless animal = Animal.find_by(id: animal_id)
        end

        AnimalSerializer.new(Animal.update!(animal_id, animal_params))
    end
end