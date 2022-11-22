require 'stripe'
class CreateCustomerPortal

    def create_portal_session(stripe_customer_id)
      begin
        session = Stripe::BillingPortal::Session.create({
            customer: stripe_customer_id,
            return_url: 'http://localhost:3000/seller/product',
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