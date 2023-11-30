class RealEstate < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true,  length: {minimum: 2}
  validates :description, presence: true,  length: {minimum: 2}
  validates :price, presence: true,  comparison: {greater_than: 0}
  validates :phone_number, presence: true,  length: {in: 11..12}
end
