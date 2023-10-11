class Address < ApplicationRecord
  
  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end
end
