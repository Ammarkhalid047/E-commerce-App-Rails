class Payment < ApplicationRecord
  enum pay_type: {subscription_payment: 0, order_payment: 1}
  belongs_to :user
  belongs_to :plan
  
end
