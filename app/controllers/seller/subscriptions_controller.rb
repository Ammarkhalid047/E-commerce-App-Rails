class Seller::SubscriptionsController < ApplicationController
  
  def new
    @plan = current_user.plan
  end

  def create
    object = CreateSubscription.new
    subscription = object.subscription_create(params[:subscription][:price_id])
  end

  def portalsession
    object = CreateCustomerPortal.new
    portal = object.create_portal_session(current_user.stripe_customer_id)
    redirect_to portal.url
  end

end
