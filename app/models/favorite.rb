class Favorite < ApplicationRecord
  belongs_to :product
  belongs_to :user

  # Finds if a product is in a user's wish list
  scope :product_favourite, -> (user, product) { where(['user_id=? AND product_id=?', user, product]) }


end
