class Product < ApplicationRecord
  belongs_to :user
  # belongs_to :card
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end
