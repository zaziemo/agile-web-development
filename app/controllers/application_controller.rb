class ApplicationController < ActionController::Base
  before_action :authorize

  protect_from_forgery with: :exception

  protected

  def authorize
    if request.format == 'text/html'
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: 'Please log in'
      end
    else
      authenticate_or_request_with_http_basic do |username, password|
        user = User.find_by(name: username)
        ActiveSupport::SecurityUtils.secure_compare(username, user.name) &&
        ActiveSupport::SecurityUtils.secure_compare(password, user.password)
      end
    end
  end
end
