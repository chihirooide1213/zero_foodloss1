require 'test_helper'

class Customers::CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_customer_index_url
    assert_response :success
  end

end
