class Customers::ItemsController < ApplicationController

  def index
  	if  params[:genre_id]
  		@genre = Genre.find(params[:genre_id])
  		@items = @genre.items
  	else
  	   @items = Item.all
  	end
  end

  def show
  	@item = Item.find(params[:id])
  	@genre = Genre.find(@item.genre_id)
  	@cart_items = CartItem.new
     if params[:item_id]
  		@item = Item.find(params[:item_id])
   	    @posts = @item.posts
  	end
  end

  private

  	def genre_params
  		params.require(:genre).permit(:name)
  	end

end
