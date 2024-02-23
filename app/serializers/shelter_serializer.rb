class ShelterSerializer
    include JSONAPI::Serializer

    attributes :name, :user_id

    has_many :animals, serializer: AnimalSerializer
end