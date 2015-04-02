class LineItemsController < ApplicationController
  before_action :authenticate_user!
  def create
    #用户已经创建购物车，无需重复创建
    @cart = Cart.find_by(user_id: current_user.id)
    unless  @cart
      @cart = Cart.create(user_id: current_user.id)
    end
    #如果商品已经加入购物车，再次加入时，将line_item的数量加1,否则新创建line_item对象
    @line_items = LineItem.where(cart_id: @cart.id)
    @product = Product.find_by(id: params[:line_item][:product_id])
    @line_item = LineItem.find_by(product_id: @product.id)
    if @line_item.present?
      @line_item.quantity += 1
    else
      @line_item = @cart.line_items.new(line_item_params.merge(quantity: 1))
    end
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