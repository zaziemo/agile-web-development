class SessionsController < ApplicationController
  skip_before_action :authorize
  before_action :set_user, only: :create

  def new
  end

  def create
    if @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to store_index_url, notice: "Logged out"
  end

  private

  def set_user
    @user = if User.all.empty?
      User.create!(
        name: params[:name],
        password: params[:password],
        password_confirmation: params[:password]
      )
    else
      User.find_by(name: params[:name])
    end
  end
end
