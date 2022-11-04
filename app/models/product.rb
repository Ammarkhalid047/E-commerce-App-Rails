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
    
    scope :product_by_category, -> (id) {joins(:sub_categories).where(:sub_categories => {:category_id => id})}

    scope :recommended_products, -> (recommended_categories) {joins(:sub_categories).where.not(sub_categories: {:id => recommended_categories})}

    def liked?(user)
        !!self.likes.find{|like| like.user_id == user.id}
    end

    def self.reduce_stock(cart_item, product)
        if cart_item.quantity == 1
            cart_item.destroy
            product.stock +=1
        else
            cart_item.quantity -= 1
            product.stock+=1
        end
    end
    

    
end
