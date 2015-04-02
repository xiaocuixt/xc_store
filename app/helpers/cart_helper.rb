module CartHelper
  #用户已经创建购物车，无需重复创建
  def current_cart
    if current_user_sign_in?
      cart = Cart.find_by(user_id: current_user.id)
      unless @cart
        cart = Cart.create(user_id: current_user.id)
      end
    end
    cart
  end
end