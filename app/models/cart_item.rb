class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  #validates :amount, presence: true
  #validates :tax_excluded_price, presence: true
end
