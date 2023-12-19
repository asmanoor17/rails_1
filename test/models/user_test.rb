require "test_helper"

class UserTest < ActiveSupport::TestCase
 
  test "user is not valid without first_name" do
    user = User.new(
      last_name: "Doe",
      username: "john_doe"
    )
    
end 
end
