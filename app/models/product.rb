class Product < ApplicationRecord
  # Allows searching of products
  # app/models/concerns/searchable.rb
  include Searchable


  belongs_to :user
  has_one_attached :image
  has_many :product_category, dependent: :destroy
  has_many :user_wishlist, dependent: :destroy
  has_many :favorite, dependent: :destroy

  validates :name, :price, :description, presence: true
  validates :name, length: { minimum: 5 }
  validates :price, numericality: { greater_than: 0, less_than_or_equal_to: 10000 }
  validate :image_type

  # Finds all products belonging to a user
  scope :user_products, -> (user) { where(['user_id=?', user]) }

  # Finds products based on id
  scope :product_id, -> (product_id) { where('id=?', product_id) }

  # Finds new items for the carousel
  scope :new_items, -> { where('created_at > ?', Time.current - 1.weeks) }

  private

  def image_type
     if image.attached? == false
       errors.add(:image, "is missing!")
     else
       if !image.content_type.in?(%('image/jpeg image/png'))
         errors.add(:image, "needs to be a jpeg or png!")
       end
    end
  end


end
