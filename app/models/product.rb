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

  # Custom indexing
  def as_indexed_json(options = {})
  self.as_json(
    # Name and description are used to identify a product
    only: [:id, :name, :description],
  )
  end


end
