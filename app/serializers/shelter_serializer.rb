class ShelterSerializer
    include JSONAPI::Serializer
    
    has_many :animals

    attributes :name
end