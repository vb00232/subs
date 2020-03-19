require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get account" do
    get account_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Subs'
  end

end
