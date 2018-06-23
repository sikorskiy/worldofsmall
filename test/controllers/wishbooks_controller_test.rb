require 'test_helper'

class WishbooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wishbooks_new_url
    assert_response :success
  end

end
