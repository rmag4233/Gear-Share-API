class GearSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :availability, :image_URL, :user_id
  belongs_to :user
end
