class CartsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cart = Cart.find_by(user_id: current_user.id)
    @line_items = LineItem.where(cart_id: @cart.id) if @cart
  end
end