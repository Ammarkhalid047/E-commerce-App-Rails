class Order < ApplicationRecord
    enum status: {pending: 0, shipped: 1, delivered: 2 }

    belongs_to :user
    has_many :order_items, dependent: :destroy
    has_many :products, through: :order_items

end
