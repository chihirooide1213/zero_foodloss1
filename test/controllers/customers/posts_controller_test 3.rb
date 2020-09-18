require 'test_helper'

class Customers::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_posts_index_url
    assert_response :success
  end

end
