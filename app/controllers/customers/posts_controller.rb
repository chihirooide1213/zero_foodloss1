class Customers::PostsController < ApplicationController

  def create
  	@post = Post.new(post_params)
  	@post.customer_id = current_customer.id
  	if @post.save
  	   redirect_to customers_posts_path
    else
      render "new"
    end
  end

  def index
  	@posts = Post.all.order(created_at: :desc)
  end

  def new
	@post = Post.new(item_id: params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	@post.update(post_params)
  	redirect_to customers_posts_path
  end

def destroy
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to customers_posts_path
end
  private
  	def post_params
  		params.require(:post).permit(:item_id, :content, :title, :rate)
  	end

  	def order_detail_params
		params.require(:order_detail).permit(:item_id)
	end
end
