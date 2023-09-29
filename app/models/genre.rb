class Genre < ApplicationRecord
  has_many :items
  with_options presence: true do
    validates :name, presence: true
  end
end
