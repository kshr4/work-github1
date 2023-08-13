class OrderDetail < ApplicationRecord

  validates :amount , presence: true
  validates :tax_included_price , presence: true



end
