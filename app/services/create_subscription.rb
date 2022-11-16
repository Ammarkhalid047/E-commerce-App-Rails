require 'stripe'
require 'json'
class CreateSubscription

    def subscription_create(price_id)
      
      begin
        session = Stripe::Checkout::Session.create({
            success_url: '/seller/subscriptions/new',
            cancel_url: '/seller/shop',
            mode: 'subscription',
            line_items: [{
              quantity: 1,
              price: price_id,
            }],
          })
      rescue Stripe::InvalidRequestError => e
        puts "An invalid request occurred."
      rescue Stripe::StripeError => e
        puts "Another problem occurred, maybe unrelated to Stripe."
      else
        return session
      end

    end

end