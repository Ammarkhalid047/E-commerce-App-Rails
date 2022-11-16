  require 'stripe'
class CreateCustomer

    def create_stripe_customer(user)
      begin
            customer = Stripe::Customer.create(
              email: user.email,
              metadata: {
                selected_plan: user.plan
              }
            )
      rescue Stripe::InvalidRequestError => e
        puts "An invalid request occurred."
      rescue Stripe::StripeError => e
        puts "Another problem occurred, maybe unrelated to Stripe."
      else
        return customer
      end
       

    end
    def create_checkout_session(customer, user)
        plan = Plan.find_by_name(user.plan)
        checkout = Stripe::Checkout::Session.create({
          customer: customer.id,
          success_url: 'http://localhost:3000/users/sign_in',
          cancel_url: 'http://localhost:3000/users/sign_up',
          payment_method_types: ['card'],
          line_items: [{
            price: plan.price_id,
            quantity: 1,
          }],
          mode: 'subscription',
        })
    end

end