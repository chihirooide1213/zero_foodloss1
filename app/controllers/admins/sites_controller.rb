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
  	@genres = Genre.all
    now = Time.current
    # ranking = Post.where.group(:item_id).order("avg(posts.rate) desc").limit(3).pluck("item_id,avg(posts.rate)")
    # group(:item_id)→item_idが同じものにグルーピング　order("avg(posts.rate) desc")→postsの評価の平均値を昇順に並び替え
    # pluck("item_id,avg(posts.rate)")→pluckは取得するカラムを複数指定する事が出来,最後に置く。今回はitem_idと評価の平均値を取得
    # pluck("item_id,avg(posts.rate)")は配列で0番目がitem_id、1番目に平均値を表示。mapでitemとaverageの情報を引き出している
    monthly_ranking  = Post.where(created_at: Time.now.all_month).group(:item_id).order("avg(posts.rate) desc").limit(3).pluck("item_id,avg(posts.rate)")
    @monthly_ranking = monthly_ranking.map do |r|
      {
        item:Item.find(r[0]),
        average:r[1]
      }
    end

    weekly_ranking = Post.where(created_at: Time.now.all_week).group(:item_id).order("avg(posts.rate) desc").limit(3).pluck("item_id,avg(posts.rate)")
    @weekly_ranking = weekly_ranking.map do |r|
      {
        item:Item.find(r[0]),
        average:r[1]
      }
    end
    daily_ranking = Post.where(created_at: Time.now.all_day).group(:item_id).order("avg(posts.rate) desc").limit(3).pluck("item_id,avg(posts.rate)")
    @daily_ranking = daily_ranking.map do |r|
      {
        item:Item.find(r[0]),
        average:r[1]
      }
    end
    #　 Post.ranking("月間の条件")
    #　 Post.ranking("習慣の条件")
    #  Post.ranking("")
  end

  private
    def item_params
        params.require(:item).permit(:name, :item_image, :introduction, :genre_id, :price, :is_active)
    end
    #@post = Post.average(:rate)
    #@posts = @post.order(rate: "DESC")
end
