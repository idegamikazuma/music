require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get posts_upload_url
    assert_response :success
  end

end
