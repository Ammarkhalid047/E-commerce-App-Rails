module PriceExtension

    def get_discount()
        self.product.price.to_f - (self.product.price.to_f/100)*(self.product.shop.value.to_f)
    end

    def orignial_price
        if self.product.shop != nil && self.product.shop.discount?
            (self.product.price.to_f - (self.product.price.to_f/100) * (self.product.shop.value.to_f) )* (self.quantity).to_i
        else
        (self.product.price).to_i * (self.quantity).to_i
        end
    end

    def get_price(discounted_item)
        if self == discounted_item
            
            if self.product.sub_categories.last.type == 'flat'

                if self.product.shop != nil && self.product.shop.discount?
   
                    price = (((self.product.price).to_i)-(self.promo.value) * (self.quantity).to_i) - ((self.product.price.to_f/100)*(self.product.shop.value.to_f))
                else
                    price = (((self.product.price).to_i)-(self.promo.value) * (self.quantity).to_i)
                end 

            else

               if self.product.shop != nil && self.product.shop.discount?
                
                    price = (((self.product.price).to_f-((self.product.price).to_f)/100*(self.product.sub_categories.last.value)) * (self.quantity).to_f) - ((self.product.price.to_f/100)*(self.product.shop.value.to_f))
               else
                    price = ((self.product.price).to_f-((self.product.price).to_f)/100*(self.product.sub_categories.last.value)) * (self.quantity).to_f
               end
               
            end

        end
        return price
    end
  
end