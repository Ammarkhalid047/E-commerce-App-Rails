module DiscountExtension
    def get_discount()
        self.price.to_f - (self.price.to_f/100)*(self.shop.value.to_f)
    end
end