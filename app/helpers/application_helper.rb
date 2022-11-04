module ApplicationHelper
    def get_price(cart, discounted_item)
        if cart == discounted_item
            if cart.product.sub_categories.last.type == 'flat'
                price = ((cart.product.price).to_i)-(cart.promo.value) * (cart.quantity).to_i
            else
               price = ((cart.product.price).to_f-((cart.product.price).to_f)/100*(cart.product.sub_categories.last.value)) * (cart.quantity).to_f
            end
        end
        return price
    end
end
