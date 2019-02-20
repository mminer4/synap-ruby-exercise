class OrganizationsControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get api_organizations_url
        assert_response :success
    end
end