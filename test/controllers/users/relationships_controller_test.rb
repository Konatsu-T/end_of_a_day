require 'test_helper'

class Users::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get follower" do
    get users_relationships_follower_url
    assert_response :success
  end

  test "should get followed" do
    get users_relationships_followed_url
    assert_response :success
  end

end
