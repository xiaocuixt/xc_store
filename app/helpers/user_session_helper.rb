module UserSessionHelper
  def sign_in(user)
    session[:user] = user
  end
end