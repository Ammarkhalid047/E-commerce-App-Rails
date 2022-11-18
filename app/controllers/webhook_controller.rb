class WebhookController < ApplicationController
    skip_before_action :verify_authenticity_token
    protect_from_forgery with: :null_session

def create

    endpoint_secret = 'whsec_Q2cIsw3lUlYYz5bD5qjJArPrCRhp1pw6'
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil
    begin
        event = Stripe::Webhook.construct_event(
            payload, sig_header, endpoint_secret
        )
    rescue JSON::ParserError => e 
        # Invalid payload
        puts 'parseError'
        return
    rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        puts 'SignatureError'
        return
    end

    # Handle the event
    case event.type
    when 'checkout.session.async_payment_failed'
        session = event.data.object
    when 'checkout.session.async_payment_succeeded'
        session = event.data.object
    when 'checkout.session.completed'

        object = UpdateCustomer.new
        user = User.find_by_email(event.data.object.customer_details.email)
        customer = object.update_subscription_status(user)

    when 'checkout.session.expired'
        session = event.data.object
    when 'customer.created'

        object = UpdateCustomer.new
        user = User.find_by_email(event.data.object.email)
        customer = object.update_stripe_id(user, event.data.object.id)

    when 'customer.subscription.created'
        subscription = event.data.object
    when 'customer.subscription.deleted'
        subscription = event.data.object
    when 'payment_intent.amount_capturable_updated'
        payment_intent = event.data.object
    when 'payment_intent.canceled'
        payment_intent = event.data.object
    when 'payment_intent.created'
        payment_intent = event.data.object
    when 'payment_intent.partially_funded'
        payment_intent = event.data.object
    when 'payment_intent.payment_failed'
        payment_intent = event.data.object
    when 'payment_intent.processing'
        payment_intent = event.data.object
    when 'payment_intent.requires_action'
        payment_intent = event.data.object
    when 'payment_intent.succeeded'
        payment_intent = event.data.object
    # ... handle other event types
    else
        puts "Unhandled event type: #{event.type}"
    end
end

end
