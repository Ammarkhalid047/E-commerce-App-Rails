module PriceExtension

    def orignial_price
        (self.product.price).to_i * (self.quantity).to_i
    end

    def get_price
        if self.promo.nil?
            (self.product.price).to_i * (self.quantity).to_i
        else
            if self.promo.type == 'flat'
                ((self.product.price).to_i)-(self.promo.value) * (self.quantity).to_i
            else
                ((self.product.price).to_f-((self.product.price).to_f)/100*(self.promo.value)) * (self.quantity).to_f
            end
        end
    end
  
end