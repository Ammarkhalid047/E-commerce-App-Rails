class Product < ApplicationRecord
    mount_uploaders :images, ImageUploader  

    has_many :product_categories, dependent: :destroy
    has_many :sub_categories, through: :product_categories
    
    has_many :cart_items, dependent: :destroy
    has_many :order_items, dependent: :destroy

    has_many :reviews, dependent: :destroy
    has_rich_text :description

    belongs_to :promo, optional: true

    has_many :likes
    def liked?(user)
        !!self.likes.find{|like| like.user_id == user.id}
    end
    
    
    
end
