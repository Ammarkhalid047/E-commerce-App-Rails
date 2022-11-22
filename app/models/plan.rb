class Plan < ApplicationRecord
    has_many :payment, dependent: :destroy
    has_many :user, dependent: :destroy
    has_many :subscriptions, dependent: :destroy
end
