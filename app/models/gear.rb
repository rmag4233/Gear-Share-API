class Gear < ApplicationRecord
  belongs_to :user
  has_many :loans, dependent: :destroy
  validates :user, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :availability, presence: true
  validates :image_URL, presence: true
end
