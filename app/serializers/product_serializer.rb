class ProductSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :price, :rating, :image ,:image_url
end
