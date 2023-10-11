class Customer < ApplicationRecord
  has_many :cart_items
  has_many :addresses
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :lastname_kanji, presence: true
  validates :firstname_kanji, presence: true
  validates :lastname_kana, presence: true
  validates :lastname_kana, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  #validates :email, presence: true
  
  # is_deletedがfalseならtrueを返す
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
