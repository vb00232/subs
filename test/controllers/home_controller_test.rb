require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Subs'
  end

  test "should get contact" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Subs'
  end

  test "should get help" do
    get help_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Subs'
  end

end
