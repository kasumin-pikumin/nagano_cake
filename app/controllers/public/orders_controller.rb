class Public::OrdersController < ApplicationController


  def new
    @cart_items = current_customer.cart_items.all
    @order = Order.new
    @customer = current_customer
  end


  def confirm
    @order = Order.new(order_params)

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render 'new'
    end

    @cart_items = current_customer.cart_items.all
    @shopping_cost = 800
    @total_price = 0
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @shopping_cost = 800
    @order_details = @order.order_details.all
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save!
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_details = @order.order_details.new
        @order_details.item_id = cart_item.item.id
        @order_details.price = cart_item.item.price
        @order_details.amount = cart_item.amount
        @order_details.save
      end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end


  private

  def order_params
    params.require(:order).permit(:shopping_cost, :payment, :status, :payment_method, :postal_code, :address, :name, :item_id)
  end



end
