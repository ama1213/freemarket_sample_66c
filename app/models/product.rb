class Product < ApplicationRecord
  belongs_to :user,foreign_key: 'user_id'
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  has_many :images, dependent: :destroy

  def self.search(search)
    if search
      Product.where(['name LIKE ?', "%#{search}%"])
    else
      Product.all
    end
  end
end
