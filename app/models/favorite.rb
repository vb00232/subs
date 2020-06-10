class Favorite < ApplicationRecord
  belongs_to :product
  belongs_to :user

  # Finds all records for a product
  scope :find_product, -> (product_id) { where(product_id: product_id) }

  # Finds all records for a user
  scope :find_user, -> (user_id) { where(user_id: user_id) }

end
