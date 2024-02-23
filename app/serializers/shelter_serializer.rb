class ShelterSerializer
    include JSONAPI::Serializer

    attributes :name

    has_many :animals, serializer: AnimalSerializer
end