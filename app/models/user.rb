class User < ApplicationRecord

  after_create :create_shoppingcart

  enum role: {admin: 0, buyer: 1, seller: 2}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :additional, dependent: :delete
  accepts_nested_attributes_for :additional
  has_one :shoppingcart, dependent: :destroy
  has_many :order
  has_many :reviews, dependent: :destroy

  has_many :likes

  def create_shoppingcart
    @cart = Shoppingcart.new(user_id: User.last.id)
    @cart.save
  end
end
