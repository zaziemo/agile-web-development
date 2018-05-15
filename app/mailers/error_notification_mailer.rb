class ErrorNotificationMailer < ApplicationMailer
  default from: 'depot@example.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def error_occured(error)
    @error = error

    mail to: 'maren.heltsche@gmail.com', subject: 'An Error has occured'
  end
end
