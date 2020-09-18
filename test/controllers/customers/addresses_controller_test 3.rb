require 'test_helper'

class Customers::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_addresses_index_url
    assert_response :success
  end

end
