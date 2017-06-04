require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
	def setup
		@user = users(:michael)
	end


  test "login with invalid information" do 
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, params: { session: { email: "", password: ""}}
  	assert_template 'sessions/new'
  	assert_not flash.empty?
  	get root_path
  	assert flash.empty?
  end


  test "login with valid information followed by logout" do
  	get login_path
  	post login_path, params: { session: { email: @user.email, password: 'password'}}
  	

    assert is_logged_in?
  	#Vérifie que l'on a le bon redirected target
  	assert_redirected_to @user
  	#Visite la page
  	follow_redirect!
  	assert_template 'users/show'

  	#Vérifie qu'il y a zéro lien vers une page de login lorsqu'on est in
  	assert_select "a[href=?]", login_path, count: 0
  	assert_select "a[href=?]", logout_path
  	assert_select "a[href=?]", user_path(@user)
  
    #Partie qui log out
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,     count: 0
    assert_select "a[href=?]", user_path(@user),count: 0
  end
end
