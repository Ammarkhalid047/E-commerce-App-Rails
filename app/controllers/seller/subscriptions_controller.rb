class Seller::SubscriptionsController < ApplicationController
  
  def new
    @plans = Plan.all
  end

  def create
    object = CreateSubscription.new
    subscription = object.subscription_create(params[:subscription][:price_id])
  end

  def portalsession
    object = CreateCustomerPortal.new
    portal = object.create_portal_session(current_user.stripe_customer_id)
  end

end
