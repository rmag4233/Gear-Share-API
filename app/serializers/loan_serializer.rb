class LoanSerializer < ActiveModel::Serializer
  attributes :id, :loan_start, :loan_end
  has_one :borrower
  has_one :owner
  has_one :gear
end
