require 'stripe'
class UpdateCustomer

    def update_subscription_status(user)
      user.update!(subscription_status: 1)
      payment = Payment.new(pay_type: 0, user_id: user.id, plan_id: plan.id, amount: user.payments.last.plan)
      payment.save
    end

    def update_stripe_id(user, customer_id)
      user.update!(stripe_customer_id: customer_id)
    end

end