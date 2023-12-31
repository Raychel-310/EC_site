class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  #has_many :order_details
  enum is_sale: {"販売中":true, "販売停止中":false}
  #with_options presence: true do
   #validates :name, presence: true
   #validates :explanation, presence: true
   #validates :tax_excluded_price, presence: true
   
  #end
  has_one_attached :image
  
  def tax_included_price
    (self.tax_excluded_price * 1.1).floor
  end
end
