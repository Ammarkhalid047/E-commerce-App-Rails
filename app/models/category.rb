class Category < ApplicationRecord
    has_many :product_categories, dependent: :destroy
    has_many :products, through: :product_categories
    has_many :sub_categories, dependent: :destroy

    extend FriendlyId
    friendly_id :title, use: :slugged
end
