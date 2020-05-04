class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  # Finds all records that match a product
  scope :find_category, -> (product_id) { where(['product_id=?', product_id]) }

end
