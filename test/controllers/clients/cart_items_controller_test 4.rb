require 'test_helper'

class Clients::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clients_cart_items_index_url
    assert_response :success
  end

end
