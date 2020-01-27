class Product < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  def self.search(search)
    if search
      Product.where(['name LIKE ?', "%#{search}%"])
    else
      Product.all
    end
  end
end
