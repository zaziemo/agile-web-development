require 'test_helper'

class ErrorNotificationMailerTest < ActionDispatch::IntegrationTest

  test "send email when record not found error occurs" do
    get "/carts/wibble"
    assert_response :redirect
    assert_template "/"

    mail = ActionMailer::Base.deliveries.last
    assert_equal ["maren.heltsche@gmail.com"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_equal "An Error has occured", mail.subject
  end
end
