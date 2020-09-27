class Customers::ItemsController < ApplicationController

  def index
  	if  params[:genre_id]
  		@genre = Genre.find(params[:genre_id]).where(is_active: 1)
  		@items = @genre.items
  	else
  	   @items = Item.where(is_active: 1)
  	end
  end

  def show
  	@item = Item.find(params[:id])
  	@genre = Genre.find(@item.genre_id)
  	@cart_items = CartItem.new
   	@posts = @item.posts
  end

  private

  	def genre_params
  		params.require(:genre).permit(:name)
  	end

  	def item_params
  		params.require(:item).permit(:name,:item_image_id)
  	end

end
