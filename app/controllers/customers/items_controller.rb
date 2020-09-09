class Customers::ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  	@genre = Genre.find(@item.genre_id)
  	@cart_items = CartItem.new
  end
end
