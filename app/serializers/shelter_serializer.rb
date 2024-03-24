class ShelterSerializer
    include JSONAPI::Serializer

    attributes :name, :user_id, :animals

    has_many :animals, serializer: AnimalSerializer
end