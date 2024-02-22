class AnimalDestroyer
    def self.destroy(id)
        Animal.find(id).destroy
    end
end