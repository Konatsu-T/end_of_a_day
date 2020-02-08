require 'test_helper'

class User::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get follower" do
    get user_relationships_follower_url
    assert_response :success
  end

  test "should get followed" do
    get user_relationships_followed_url
    assert_response :success
  end

end
