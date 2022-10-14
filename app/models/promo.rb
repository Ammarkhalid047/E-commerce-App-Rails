class Promo < ApplicationRecord
  self.inheritance_column = :foo
  # attr_accessible :type
  has_many :product
  has_many :cart_item
  has_many :order_item
end
