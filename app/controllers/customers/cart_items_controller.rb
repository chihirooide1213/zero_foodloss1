class Customers::CartItemsController < ApplicationController
	  before_action :authenticate_customer!
    before_action :set_cart_item, only: [:update, :edit, :destroy]
    before_action :set_customer

  def index
    	@cart_items = @customer.cart_items.all
  end

  def create
  	@cart_item = current_customer.cart_items.new(cart_item_params)
  	@current_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: @cart_item.customer_id)
  	@cart_item.customer = current_customer
    # カートに同じ商品がなければ新規追加、あれば既存のデータと合算
    if @current_item.nil?
        if @cart_item.amount.blank?
            @cart_item.amount = 1
        end
        if @cart_item.save
          redirect_to customers_cart_items_path
        else
          @cart_items = @customer.cart_items.all
          redirect_to customers_cart_items_path
        end
#カート内が空でない場合
    else
        if @cart_item.amount.blank?
           @cart_item.amount = 0
        end
      @current_item.amount += @cart_item.amount
#カート内商品の数量を更新した上で、カート内商品一覧画面へ遷移
      @current_item.update(item_params)
      redirect_to customers_cart_items_path
      end
  end

  def update
  	@cart_items = @customer.cart_items.all
  	@cart_item.update(cart_item_params)
  	redirect_to customers_cart_items_path
  end

  def destroy
  	@cart_item.destroy
  	redirect_to customers_cart_items_path
  end

  def destroy_all
  	@customer.cart_items.destroy_all
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
