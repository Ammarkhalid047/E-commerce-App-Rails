class User < ApplicationRecord

  after_create :create_shoppingcart
  after_create :create_shop

  enum role: {admin: 0, buyer: 1, seller: 2}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_one :additional, dependent: :delete
  accepts_nested_attributes_for :additional
  has_one :shoppingcart, dependent: :destroy
  has_many :order
  has_many :reviews, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_one :shop, dependent: :destroy


  def create_shoppingcart
    @cart = Shoppingcart.new(user_id: User.last.id)
    @cart.save
  end


  def create_shop
    if User.last.role == 'seller'
      @shop = Shop.new(user_id: User.last.id)
      @shop.save
    end
  end


  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    if user
      user.provider = auth.provider
      user.uid = auth.uid
      user.save
    else
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end
    user
  end
end
