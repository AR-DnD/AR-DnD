# require 'test_helper'
#
# class UserTest < ActiveSupport::TestCase
# 	def setup
# 		@user = User.new(name: "whatever", email: "whatever")
# 	end
#
# 	test "name is too long" do
# 		@user.username = "a"*16
# 		assert_not @user.valid?
# 	end
#
# 	test "name is too short" do
# 		@user.username = "a"*2
# 		assert_not @user.valid?
# 	end
#
# 	test "email is too long" do
# 		@user.email = "a"*104 + "@whatever.com"
# 		assert_not @user.valid?
# 	end
#
# 	test "email should accept a valid email format" do
# 		valid_addresses = %w[whatever@whatever.com WHATEVER@whatever.COM W_HAT-EVER@whatever.org
# 			                 what.ever@whatever.com what+ever@whatever.ca]
# 	    valid_addresses do |valid_address|
# 	    	@user.email = valid_address
# 	    	assert @user.valid?, "#{valid_address.inspect} is valid"
# 	    end
# 	end
#
# 	test "email should reject an invalid email format" do
# 		invalid_addresses = %w[whatever@whatever,com whatever.org what.ever@whatever.
#                                whatever@what_ever.com whatever@what+ever.com]
#       invalid_addresses do |invalid_address|
#       	@user.email = invalid_address
#       	assert_not @user.valid? "#{invalid_address.inspect} is not valid"
#       end
#   end
#
#   test "email database should not allow duplicates" do
#   	possible_duplicate = @user.dup
#   	#to make sure when the format to be uppercase it still works
#   	possible_duplicate.email = @user.email.uppercase
#   	@user.save
#   	#after use itself gets saved, then its duplicate will not be allowed
#   	assert_not possible_duplicate.valid?
#   end
#
#   # test "the truth" do
#   #   assert true
#   # end
#   def setup
#     @user = User.new(username: "Example User", email: "user@example.com",
#                      password: "foobar", password_confirmation: "foobar")
#   end
#     test "authenticated? should return false for a user with nil digest" do
#     assert_not @user.authenticated?('')
#   end
#
# end
