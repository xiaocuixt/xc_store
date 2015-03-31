class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by("name = ? OR email = ?", params[:user_name_or_email], params[:user_password])
    unless params[:user_name_or_email].present?
      return render js: "$('#js-alert').html('用户名不能为空');"
    end
    unless @user.present?
      return render js: "$('#js-alert').html('用户不存在');"
    end
    unless params[:user_password].present?
      return render js: "$('#js-alert').html('密码不能为空');"
    end
    if @user.validate?(params[:user_password])
      #sign_in(@user)
      return render js: "window.location.href='#{root_url}'"
    else
      return render js: "$('#js-alert').html('密码不正确');"
    end
  end
end