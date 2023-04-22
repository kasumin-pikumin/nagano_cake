class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @shopping_cost = 800
    @order_details = @order.order_details.all
  end
end
