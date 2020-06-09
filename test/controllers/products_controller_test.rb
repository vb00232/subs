require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @user = users(:one)
    # Simulates a user signing in
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end

  test "should get index" do
    get products_url
    assert_response :success
    # Checks correct layout is used
    assert_template layout: 'application'
  end

end
