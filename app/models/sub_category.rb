class SubCategory < ApplicationRecord
  self.inheritance_column = :foo

  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories
  belongs_to :category
  has_many :promo

  scope :recommended_categories, -> (user) { joins(products: :likes).where(:likes => {:user_id => user}).distinct }
end
