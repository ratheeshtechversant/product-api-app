class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :image_url
end
