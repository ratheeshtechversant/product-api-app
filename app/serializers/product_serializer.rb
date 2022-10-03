class ProductSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :price, :rating,:category_id, :image ,:image_url
end
