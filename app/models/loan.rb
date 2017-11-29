class Loan < ApplicationRecord
  belongs_to :borrower, class_name: 'User', foreign_key: 'borrower_id'
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :gear
  validates :borrower_id, presence: true
  validates :gear_id, presence: true
  validates :owner_id, presence: true
end
