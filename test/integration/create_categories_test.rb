require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.create( username: "john", email: "john@example.com", password: "password", admin: true)
	end

	test "get new cat form and create" do
		sign_in_as(@user, "password")
		get new_category_path
		assert_template 'categories/new' #get new form
		assert_difference 'Category.count', 1 do #post to new form
			post categories_path, params:{category: {name:"sports"}} #create category
			follow_redirect! #redirect to index page
		end
		assert_template 'categories/index'
		assert_match "sports", response.body #checks if category has been created and posted
	end

	test "invalid category submitted" do
		sign_in_as(@user, "password")
		get new_category_path
		assert_template 'categories/new' #get new form
		assert_no_difference 'Category.count' do #post to new form
			post categories_path, params:{category: {name:" "}} #create category
		end
		assert_template 'categories/new'
		assert_select 'h2.panel-title' #ensure validation messages are showing up by looking for title and body from _errors partial
		assert_select 'div.panel-body'
	end

end #end of class
