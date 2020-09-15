class Admins::GenresController < ApplicationController
  def index
  	@genres = Genre.all
  	@genre = Genre.new
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	if @genre.update(genre_params)
  		if @genre.is_active  == 1
  		   @items = @genre.items
  		   @items.each do |item|
  		   	item.is_active = 2
  		   	item.update(item_params)
  		 	end
  		end
  		redirect_to admins_genres_index_path
  	else
  		render 'edit'
  	end
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
  	redirect_to admins_genres_index_path
  end

  private

  	def genre_params
  	  params.require(:genre).permit(:name, :is_active)
  	end

  	def item_params
  		params.require(:item).permit(:is_active)
  	end
end
