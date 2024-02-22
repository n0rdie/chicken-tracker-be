class AnimalSerializer
    include JSONAPI::Serializer

    belongs_to :shelter
    
    attributes :shelter_id, :name, :species, :birthday, :color, :slogan, :diet, :speed
end