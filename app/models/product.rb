require 'elasticsearch/model'

class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # Automatically update Elasticsearch index based on model changes
  include Elasticsearch::Model
  # Automatically injects the callback subscribers, e.g after_save
  include Elasticsearch::Model::Callbacks

  # Finds all products belonging to a user
  scope :user_products, -> (user) { where(['user_id=?', user]) }

  # Finds products based on id
  scope :product_id, -> (product_id) { where('id=?', product_id) }

  # Custom indexing
  def as_indexed_json(options = {})
  self.as_json(
    # Fields used to identify a product
    only: [:id, :name, :description, :price],
  )
  end

  def self.search_query(query)
    Product.__elasticsearch__.search(
      query: {
        multi_match: {
          query: query,
          fields: ['name', 'description']
        }
      }
    ).results
  end

end
