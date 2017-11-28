class LoanSerializer < ActiveModel::Serializer
  attributes :id
  has_one :borrower
  has_one :owner
  has_one :gear
end
