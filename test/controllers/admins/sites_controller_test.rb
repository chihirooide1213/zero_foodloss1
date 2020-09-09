require 'test_helper'

class Admins::SitesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admins_sites_top_url
    assert_response :success
  end

end
