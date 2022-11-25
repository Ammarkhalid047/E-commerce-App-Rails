class Product < ApplicationRecord
    include DiscountExtension

    before_create :check_seller_plan

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

    def check_seller_plan   
        product_count = self.shop.products.where('created_at > ?', DateTime.now.beginning_of_month).count
        byebug
        plan = self.shop.user.plan
        case plan.name
        when 'Premium Plan'
            if product_count >= plan.no_of_products || self.images.length > plan.no_of_images
                self.errors.add(:created_at, 'You have reached your limit for this month')
                throw :abort
            else
                return true
            end
        when 'Gold Plan'
            if product_count >= plan.no_of_products || self.images.length > plan.no_of_images
                self.errors.add(:created_at, 'You have reached your limit for this month')
                throw :abort
            else
                return true 
            end
        when 'Basic Plan'
            if product_count >= plan.no_of_products || self.images.length > plan.no_of_images
                self.errors.add(:created_at, 'You have reached your limit for this month')
                throw :abort
            else
                return true
            end
        end
    end

    
end
