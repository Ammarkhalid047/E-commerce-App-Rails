if Rails.env == 'development'
    Rails.configuration.stripe = {
      :publishable_key => ENV['MY_PUBLISHABLE_KEY'],
      :secret_key      => ENV['MY_SECRET_KEY']
    }
  else
    Rails.configuration.stripe = {
      :publishable_key => ENV['TEST_MY_PUBLISHABLE_KEY'],
      :secret_key      => ENV['TEST_MY_SECRET_KEY']
    }
  end
  
  Stripe.api_key = ENV['TEST_MY_SECRET_KEY']