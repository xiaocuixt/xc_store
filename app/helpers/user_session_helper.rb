module UserSessionHelper
  #将登陆user的id存到session里
  def sign_in(user)
    session[:user_id] = user.id
  end

  #退出登录
  def sign_out(user)
    session[:user_id] = nil
  end
  #获取当前用户
  def current_user
    User.find_by(id: session[:user_id])
  end

  #验证用户是否登陆
  def current_user_sign_in?
    current_user.present?
  end

  #验证用户权限
  def authenticate_user!
    unless current_user_sign_in?
      return redirect_to sign_in_user_sessions_url
    end
  end
end