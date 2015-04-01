class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    unless params[:user][:name].present?
      return render js: "$('#js-alert').html('用户名不能为空');"
    end
    unless params[:user][:password].present?
      return render js: "$('#js-alert').html('密码不能为空');"
    end
    if params[:user][:password] != params[:user][:password_confirmation]
      return render js: "$('#js-alert').html('两次输入密码不一致');"
    end
    if @user.save
      return render js: "window.location.href='#{root_url}'"
    end
  end
  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end