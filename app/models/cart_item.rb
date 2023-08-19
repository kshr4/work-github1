class CartItem < ApplicationRecord

  validates :amount , presence: true

belongs_to :item

end
