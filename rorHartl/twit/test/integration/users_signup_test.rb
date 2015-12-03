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
end
