class SubCategory < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories
  belongs_to :category
end
