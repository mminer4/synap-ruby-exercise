class OrganizationsControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get organizations_url
        assert_response :success
    end
end