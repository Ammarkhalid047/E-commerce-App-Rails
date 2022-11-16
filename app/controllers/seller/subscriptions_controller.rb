class Seller::SubscriptionsController < ApplicationController
  
  def new
    @plans = Plan.all
  end

  def create
    createsubscription = CreateSubscription.new
    subscription = createsubscription.subscription_create(params[:subscription][:price_id]);
    byebug
  end

end
