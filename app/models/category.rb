class Category < ApplicationRecord
    has_many :sub_categories, dependent: :destroy
    extend FriendlyId
    friendly_id :title, use: :slugged

    scope :product_by_category, -> (id) {joins(:sub_categories).where(:sub_categories => {:category_id => id})}
end
