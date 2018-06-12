require 'test_helper'

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "changing a password" do
    assert_equal(@user, @user.authenticate('secret'))

    patch(
      user_password_url(@user),
      params: {
        user: {
          current_password: 'secret',
          password: '123456',
          password_confirmation: '123456'
        }
      }
    )

    assert_equal(@user, @user.reload.authenticate('123456'))
  end
end
