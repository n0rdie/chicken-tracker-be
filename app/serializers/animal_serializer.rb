class AnimalSerializer
    include JSONAPI::Serializer
    
    attributes :shelter_id, :name, :species, :birthday, :color, :slogan, :diet, :speed
end