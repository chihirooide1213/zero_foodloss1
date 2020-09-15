class Customers::AddressesController < ApplicationController
  def index
  	@address = Address.new
  	@addresses = current_customer.addresses
  end

  def create
  	@address = Address.new(address_params)
  	@address.customer_id = current_customer.id
  	@addresses = current_customer.addresses
  	if @address.save
  		redirect_to customers_addresses_path
  	else
  		render :index
  	end
  end

  def edit
  	@address = Address.find(params[:id])
  end

  def update
  	@address = Address.find(params[:id])
  	if @address.update
  		redirect_to customers_addresses_path
   else
   		render :index
   end
  end

  def destroy
  	@address = Address.find(params[:id])
  	@address.destroy
  	redirect_to customers_addresses_path
  end

  private
  def address_params
        params.require(:address).permit(:postal_code, :name, :address)
  end
end
