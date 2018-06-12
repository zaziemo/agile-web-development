class PasswordsController < ApplicationController
  before_action :set_user, only: :update

  def update
    respond_to do |format|
      if @user.present? && @user.update(user_params)
        format.html { redirect_to users_url, notice: "Password was successfully updated." }
      else
        @user = User.find(params[:user_id])
        @user.errors.add(:current_password, "is incorrect.")
        format.html { render 'users/edit' }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id]).authenticate(params[:user][:current_password])
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
