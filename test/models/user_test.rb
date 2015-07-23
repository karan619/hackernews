require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Karan Valecha", email: "karan.valecha92@gmail.com",
                            password: 'password', password_confirmation: 'password')
  end
  test "valid user" do
    assert @user.valid?
  end
  test "name cannot be blank" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email cannot be blank" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "max name and email" do
    @user.name = "a"*31
    assert_not @user.valid?
    @user.name = "karan"
    @user.email = "a"*250 + "@gamail.com"
    assert_not @user.valid?
  end

  test "duplicate email should not be valid" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "wrong email" do
    @user.email = "1aa@233-ccom"
    assert_not @user.valid?
  end

  test "Blank password test" do
    @user.password = @user.password_confirmation = " "*6
    assert_not @user.valid?
  end

  test "short password test" do
    @user.password = @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end
end
