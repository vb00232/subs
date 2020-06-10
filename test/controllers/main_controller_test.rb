require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get main_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Subs'
  end

end
