class Customers::CartItemsController < ApplicationController
	before_action :authenticate_customer!
    before_action :set_cart_item, only: [:show, :update, :destroy, :edit]
    before_action :set_customer

  def index
    	@cart_items = @customer.cart_items.all
  end

  def create
  	# @item = Item.find(params[:cart_item][:id])
  	@cart_item = current_customer.cart_items.new(cart_item_params)
  	@cart_item.save!
  	redirect_to customers_cart_items_path
  	@current_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: @cart_item.customer_id)
  	@cart_item.customer = current_customer
  end

  def update
  	@cart_items = current_customer.cart_items.all
  	if @cart_items.update(cart_item_params)
  		redirect_to customers_cart_items_path
  	end
  end

  def destroy
  	@cart_items = current_customer.cart_items.find(params[:id])
  	@cart_items.destroy
  	redirect_to customers_cart_items_path
  end

  def destroy_all
  	@cart_items = current_customer.cart_items.all
  	@cart_items.destroy_all
  	redirect_to customers_cart_items_path
  end

  private
  def set_customer
  	@customer = current_customer
  end

  def set_cart_item
  	@cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
  	params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

  def item_params
  	params.permit(:amount)
  end
end
