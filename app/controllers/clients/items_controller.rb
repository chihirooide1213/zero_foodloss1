class Clients::ItemsController < ApplicationController
  def index
  	@items = Item.where(client_id: current_client, is_active: 1)
  	client = current_client
  	if client.id != current_client.id
  		redirect_to admins_sites_top_path
  	end
  end

  def show
  	@item = Item.find(params[:id])
    @genre = Genre.find(@item.genre_id)
        if @item.is_active == 1
            @item_status = "販売中"
        else
            @item_status = "販売停止中"
        end
  end

  def create
  	@item = Item.new(item_params)
  	@item.client = current_client
  	@item.save!
  	redirect_to clients_items_index_path
  end

  def new
  	@item = Item.new
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to clients_item_path(@item)
  end

  private

    def item_params
        params.require(:item).permit(:name, :item_image, :introduction, :genre_id, :price, :is_active, :client_id)
    end
end
