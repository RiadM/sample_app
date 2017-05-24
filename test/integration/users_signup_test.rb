require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do 
  	get signup_path
  	assert_no_difference 'User.count' do
  		post users_path, params: { user: {
  			name: "",
  			email: "user@invalid",
  			password:          "foo",
  			password_confirmation: "bar"
  		}}
  	end
  	assert_template 'users/new'
  	assert_select 'div#<CSS id for error explanation'
  	assert_select 'div.<CSS class for field with error'
  	
  end


  test "valid signup information" do 
    get signup_path
    assert_difference 'User.count' do
      post users_path, params: { user: { name: "Example User",
                                         email: "Example@example.com",
                                         password: "foo",
                                         password_confirmation: "foo" }}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end
end
