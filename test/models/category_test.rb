require "test_helper"

class CategoryTest < ActiveSupport::TestCase
        setup do
          @category = categories(:one) # assuming you have fixture data with at least one category
        end
      
        test "should get index" do
          get categories_url
          assert_response :success
        end
      
        test "should show category" do
          get category_url(@category)
          assert_response :success
        end
      
        test "should get new" do
          get new_category_url
          assert_response :success
        end
      
        test "should create category" do
          assert_difference('Category.count') do
            post categories_url, params: { category: { name: 'New Category' } }
          end
      
          assert_redirected_to category_url(Category.last)
        end
      
        test "should get edit" do
          get edit_category_url(@category)
          assert_response :success
        end
      
        test "should update category" do
          patch category_url(@category), params: { category: { name: 'Updated Category' } }
          assert_redirected_to category_url(@category)
          @category.reload
          assert_equal 'Updated Category', @category.name
        end
      
end
