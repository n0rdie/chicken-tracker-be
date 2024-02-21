class UserSerializer
    include JSONAPI::Serializer
    
    attributes :name, :password_digest
end