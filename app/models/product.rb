class Product < ApplicationRecord
  belongs_to :user,foreign_key: 'user_id'
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
end
