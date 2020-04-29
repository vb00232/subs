class Category < ApplicationRecord
  # Finds a category based on id
  scope :find_by_id, -> (category_id) { where(['id=?', category_id]) }
  # Finds a category based on name
  scope :find_by_name, -> (name) { where(['name=?', name]) }

end
