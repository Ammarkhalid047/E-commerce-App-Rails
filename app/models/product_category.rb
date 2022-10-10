class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :sub_category, optional: true
end
