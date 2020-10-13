class Clients::FavoritesController < ApplicationController
	def create
		favorite = current_customer.favorites.build(item_id: params[:item_id])
		favorite.save
		redirect_to customers_customer_index_path
	end

	def destroy
		favorite = Favorite.find_by(item_id: params[:item_id], customer_id: current_customer.id)
    	favorite.destroy
    	redirect_to root_path
  end
end
