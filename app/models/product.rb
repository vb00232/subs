class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  scope :user_products, -> (user) { where(['user_id=?', user]) }
end
