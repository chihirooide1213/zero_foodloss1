require 'test_helper'

class Clients::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clients_items_index_url
    assert_response :success
  end

end
