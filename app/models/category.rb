class Category < ApplicationRecord
    has_many :sub_categories, dependent: :destroy
    extend FriendlyId
    friendly_id :title, use: :slugged
end
