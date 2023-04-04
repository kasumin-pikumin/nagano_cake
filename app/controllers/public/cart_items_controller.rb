class Public::CartItemsController < ApplicationController

  def create
    @cart_item = CartItem.new(cart_items_params)
    @cart_item.customer_id = current_customer
    @cart_item.item_id = params[:cart_item][:item_id]
    # binding.pry
    @cart_item.save
    redirect_to cart_items_path
  end


  def index
    @cart_items = current_customer.cart_item.all
    @item = Item.find(params[:id])
  end

  def destroy
    @cart_item = Cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_params
  end

  private

  def cart_items_params
    params.permit(:item_id, :amount)
  end

end
