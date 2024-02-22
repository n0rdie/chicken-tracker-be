class ShelterDestroyer
    def self.destroy(id)
        shelter = Shelter.find(id)

        shelter.animals.each do |animal|
            AnimalDestroyer.destroy(animal.id)
        end

        Shelter.find(id).destroy
    end
end