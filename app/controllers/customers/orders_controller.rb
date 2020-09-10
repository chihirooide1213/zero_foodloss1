class Customers::OrdersController < ApplicationController
	before_action :set_customer

	def index
		@orders = @customer.orders
	end

	def create
		if current_customer.cart_items.exists?

			@order = Order.new(order_params)
			@order.customer_id = current_customer.id
			@order.payment_method = params[:order][:payment_method]

      # 合計金額を求める
      sum_all = 0
      cart_item = current_customer.cart_items
      cart_item.each do |ci|
      	sum_item = (ci.item.price).to_i * ci.amount
      	sum_all += sum_item
      end
      @order.total_payment = sum_all + @order.shipping_cost


      # どのラジオボタンを押したかを数字で渡す
      @add = params[:order][:add].to_i
      case @add
        # 自分の住所
    when 1
    	@order.postal_code = @customer.postal_code
    	@order.address = @customer.address
    	@order.name = @customer.last_name + @customer.first_name
        # 登録済住所
    when 2
    	@order.postal_code = params[:order][:postal_code]
    	@order.address = params[:order][:address]
    	@order.name = params[:order][:name]
         # 新しいお届け先
     when 3
     	@order.postal_code            = params[:order][:postal_code]
     	@order.address                = params[:order][:address]
     	@order.name                   = params[:order][:name]
          # @orderの内容をshiping_addressに新規登録
          address = current_client.addresses.build
          address.address      = @order.address
          address.destination  = @order.name
          address.postal_code  = @order.postal_code
          address.save
      end
      @order.save!

      # メール送信機能
      # SampleMailer.send_when_purchase(@order).deliver

      # cart_productsの内容をorder_productsに新規登録
      current_customer.cart_items.each do |ci|
      	order_details              = @order.order_details.build
      	order_details.order_id     = @order.id
      	order_details.item_id      = ci.item_id
      	order_details.price        = ci.item.price
      	order_details.amount       = ci.amount
      	order_details.save
      	ci.destroy
      end

      render :thanks

  else
  	flash[:danger] = 'カートが空です。'
  	redirect_to customer_items_path(genre_sort: 0)
  end
end


def thanks
end

def new
	current_customer_cart = current_customer.cart_items
	if current_customer_cart.blank?
		flash[:danger] = 'カートが空です。'
		redirect_to customer_cart_items_path(current_customer)
	else
		@order = Order.new
	end
end

def confirm
	@order = Order.new
	@cart_items = current_customer.cart_items.all
	@order.payment_method = params[:order][:payment_method]

    # 合計金額を求める
    sum_all = 0
    @cart_items.each do |cp|
      sum_item = cp.item.price.to_i * cp.amount
      sum_all += sum_item
    end
    @order.total_payment = sum_all + @order.shipping_cost

    # どのラジオボタンを押したかを数字で渡す
    @add = params[:order][:add].to_i
    case @add
      # 自分の住所
    when 1
      @order.postal_code   = @customer.postal_code
      @order.address       = @customer.address
      @order.name          = @customer.last_name + @customer.first_name
     # 登録済住所
    when 2
    @sta = params[:order][:address].to_i
      if @sta == 0
        render "new"
      elsif
        @address = Address.find(@sta)
        @order.postal_code     = @address.postal_code
        @order.address         = @address.address
        @order.name            = @address.destination
     end

     # 入力された新しい住所
    when 3
    if params[:order][:new_add][:postal_code].blank? || params[:order][:new_add][:address].blank? || params[:order][:new_add][:destination].blank?
      render :new
    else
      @order.postal_code        = params[:order][:new_add][:postal_code]
      @order.address            = params[:order][:new_add][:address]
      @order.name               = params[:order][:new_add][:destination]
    end
   end
end

def show
	@order = Order.find(params[:id])
end

private

def set_customer
	@customer = current_customer
end

def order_params
	params.require(:order).permit(:status, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
end
end
