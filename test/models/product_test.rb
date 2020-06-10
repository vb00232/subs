require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'should not save product with no parameters' do
    product = Product.new
    product.save

    refute product.valid?
  end

  test 'should save product with valid parameters' do
    product = Product.new
    product.name = "Rishab's product"
    product.price = 5
    product.description = "A new product for testing SUBS"
    product.user = @user
    test_image = File.open('test/fixtures/files/TestImage.png')
    product.image.attach(io: test_image, filename: 'file.png')
    product.save

    assert product.valid?
  end

  test 'should not save product without image' do
    product = Product.new
    product.name = "Tom's test product"
    product.price = 5
    product.description = "A new product for testing SUBS"
    product.user = @user
    product.save

    refute product.valid?
end

end
