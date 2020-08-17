class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :catalogue
  has_one :basket

  after_create :create_basket

  private
  def create
    @basket = Basket.new(current_user)
    
    @basket.save  
  end
  
end
