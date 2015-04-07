class OrdersController < ApplicationController

  def new
    @cart = Cart.find_by(user_id: current_user.id)
    @line_items = @cart.line_items
  end

  def create
    @cart = Cart.find_by(user_id: current_user.id)
    @line_items = @cart.line_items
    @order = Order.new(user_id: current_user.id, number: SecureRandom.random_number(100_000_000),
                      quantity: @line_items.length)
    @line_items.each do |line_item|
      @order.order_line_items << OrderLineItem.new(order_id: @order.id, product_id: line_item.product.id,
                                  name: line_item.product.name, quantity: line_item.quantity,
                                  price: line_item.product.stock_amount)
      line_item.delete
    end
    @order.save
    redirect_to success_orders_path(order_number: @order.number)
  end

  def success
    @order = Order.find_by(number: params[:order_number])
    @order_line_items = @order.order_line_items
  end
end