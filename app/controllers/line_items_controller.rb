class LineItemsController < ApplicationController
  before_action :authenticate_user!
  def create
    @cart = Cart.create(user_id: current_user.id)
    @line_item = LineItem.new(line_item_params)
    @line_item.cart_id = @cart.id
    if @line_item.save
      redirect_to carts_url
    else
      render text: '加入购物车失败'
    end
  end
  private
  # def cart_params
  #   params.require(:cart).permit(:user_id)
  # end
  def line_item_params
    params.require(:line_item).permit(:product_id, :cart_id, :quantity)
  end
end