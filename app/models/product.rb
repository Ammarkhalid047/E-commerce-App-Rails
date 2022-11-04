class Product < ApplicationRecord
    include DiscountExtension

    mount_uploaders :images, ImageUploader  

    has_many :product_categories, dependent: :destroy
    has_many :sub_categories, through: :product_categories
    has_one :category
    
    has_many :cart_items, dependent: :destroy
    has_many :order_items, dependent: :destroy

    has_many :reviews, dependent: :destroy
    has_rich_text :description

    belongs_to :promo, optional: true
    belongs_to :shop, optional: true

    has_many :likes

    scope :searched, -> (name) { joins(:sub_categories).where("lower(sub_categories.title) LIKE ? OR lower(name) LIKE ? OR lower(description) LIKE ?", name.downcase, name.downcase, name.downcase) }
    
    def liked?(user)
        !!self.likes.find{|like| like.user_id == user.id}
    end
    

    
end
