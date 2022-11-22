class Subscription < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :plan
end
