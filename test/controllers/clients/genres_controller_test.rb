require 'test_helper'

class Clients::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clients_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get clients_genres_edit_url
    assert_response :success
  end

end
