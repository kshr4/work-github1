class Order < ApplicationRecord

  validates :amount_claimed , presence: true
  validates :postage , presence: true
  validates :payment_method , presence: true
  validates :address , presence: true
  validates :name , presence: true
  validates :postal_code , presence: true


end
