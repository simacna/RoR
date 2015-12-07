require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "submission link" do 

    get signup_path

    assert_no_difference 'User.count' do
    #to test form submission, we need to issue a POST request to users_path
      post users_path, user: { name: "",
                            email: "user@invalid",
                            password: "foo",
                            password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path

    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name: "Example User",
                                            email: 'user@example.com',
                                            password: 'password',
                                            password_confirmation: 'password'}
      assert_template 'users/show' #what is users/show -- also difference users/show vs users#show
  end
end
end
