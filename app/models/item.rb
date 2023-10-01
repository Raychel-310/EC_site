class Item < ApplicationRecord
  belongs_to :genre
  enum is_sale: {"販売中":true, "販売停止中":false}
  with_options presence: true do
   validates :name, presence: true
   validates :explanation, presence: true
   validates :tax_excluded_price, presence: true
   
  end
  has_one_attached :image
end
