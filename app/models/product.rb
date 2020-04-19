class Product < ApplicationRecord
  # Allows searching of products
  include Searchable

  searchkick

  belongs_to :user
  has_one_attached :image

  #enum category: [:art, :books, :clothes, :electronics, :event_tickets, :furniture, :h_and_b, :jewelery, :v_g_and_c]

  validates :name, :price,:category, :description, presence: true
  validates :name, length: { minimum: 5 }
  validates :price, numericality: { greater_than: 0, less_than_or_equal_to: 10000 }

  # Finds all products belonging to a user
  scope :user_products, -> (user) { where(['user_id=?', user]) }

  # Finds products based on id
  scope :product_id, -> (product_id) { where('id=?', product_id) }




end
