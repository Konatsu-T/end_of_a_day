require 'test_helper'

class User::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_categories_show_url
    assert_response :success
  end

end
