class Customers::CustomerController < ApplicationController
  def index
  	@customer = current_customer
  end


def edit
  @customer = Customer.find(params[:id])
end

def update
  @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
    redirect_to customers_customer_index_path
  else
    render :edit
  end
end

  private
  def customer_params
  	params.require(:customer).permit(:last_name, :first_name,:last_name_kana, :first_name_kana, :address, :telephone_number, :email)
  end

  def item_params
  	params.require(:item).permit(:client_id)
  end

  def post_params
  	params.require(:post).permit(:client_id, :item_id, :title, :content)
  end

end
