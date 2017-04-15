require 'test_helper'

class CastMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cast_members_show_url
    assert_response :success
  end

end
