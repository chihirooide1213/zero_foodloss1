class Admins::SitesController < ApplicationController
  def index
  	@items = Item.all
  end

  def create
  	@item = Item.new(item_params)
  	@item.client = current_client
  	# @genre = Genre.find(@item.genre_id)
  	@item.save!
  	redirect_to admins_sites_top_path
  end

  def new
  	@item = Item.new
  end

  def top
  	@items = Item.all
  end

  private

    def item_params
        params.require(:item).permit(:name, :item_image, :introduction, :genre_id, :price, :is_active)
    end
end
