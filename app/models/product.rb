class Product < ApplicationRecord
    mount_uploaders :images, ImageUploader  

    has_many :product_categories, dependent: :destroy
    has_many :categories, through: :product_categories
    has_many :sub_categories, through: :product_categories
    
    has_many :cart_items, dependent: :destroy

    has_rich_text :description
    

    
end
