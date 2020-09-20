require 'test_helper'

class Customers::OredersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_oreders_index_url
    assert_response :success
  end

end
