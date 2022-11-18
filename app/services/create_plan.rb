require 'stripe'
class CreatePlan

    def plan_create(name, price, duration)
      
      begin
        plan = Stripe::Product.create(
          {
            name: name,
            default_price_data: {
              unit_amount: price.to_i,
              currency: 'usd',
              recurring: {interval: duration},
            },
            expand: ['default_price'],
          },
        )
      rescue Stripe::InvalidRequestError => e
        puts "An invalid request occurred."
      rescue Stripe::StripeError => e
        puts "Another problem occurred, maybe unrelated to Stripe."
      else
        return plan
      end
       

    end

end