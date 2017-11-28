# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :gears
  has_many :loans
end
