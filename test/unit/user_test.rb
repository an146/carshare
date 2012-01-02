require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
        @empty_user = User.new
        @user1 = users(:user1)
        assert_equal @user1.email, "user1@example.com"
        @user2 = users(:user2)
        assert_equal @user2.email, "user2@example.com"
    end

    def teardown
        @empty_user = nil
        @user1 = @user2 = nil
    end

    test "should not save empty user" do
        assert !@empty_user.save
        assert_raise ActiveRecord::RecordInvalid do
            @empty_user.save!
        end
    end

    test "should save user1 and user2" do
        for user in [@user1, @user2] do
            assert user.valid?
            assert user.save
        end
    end

    test "should not accept empty or incorrect email" do
        for @user1.email in ["", "incorrect_email"] do
            assert !@user1.valid?
            assert !@user1.save
        end
    end

    test "should not save user with a duplicate email" do
        @user2.email = @user1.email
        assert !@user2.valid?
        assert !@user2.save
    end
end

# vim: ts=2 sw=2
