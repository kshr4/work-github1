class Item < ApplicationRecord

  validates :name , presence: true
  validates :introduction , presence: true
  validates :price , presence: true

  has_many :cart_items, dependent: :destroy

  has_one_attached :profile_image#画像用のカラム名

  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed

  end


end
