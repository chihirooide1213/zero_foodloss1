require 'test_helper'

class Clients::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clients_customers_index_url
    assert_response :success
  end

end
