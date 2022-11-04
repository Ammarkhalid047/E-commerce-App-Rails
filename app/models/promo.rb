class Promo < ApplicationRecord
  self.inheritance_column = :foo
  
  has_many :cart_item
  has_many :order_item, dependent: :destroy

  belongs_to :sub_category

  


end
