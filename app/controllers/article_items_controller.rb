class ArticleItemsController < ApplicationController

	before_action :authenticate_user! 

	def index
		@items = ArticleItem.all.order("created_at DESC")
	end

	def show 
		@item = ArticleItem.(params[:id])
	end

	def new
		@item = ArticleItem.new
	end


	def create
		@item = ArticleItem.new(article_params)
		if @article.save
			redirect_to @item
		else
			render 'new'
		end
	end

	private

	
	

	def find_item
		@item = Article_items.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:article_id, :user_id, :title, :titleEn, :titleFr, :titleCn, :titleEs, :titleUa,  :content, :contentEn, :contentFr, :contentCn, :contentEs,  :contentUa,)
		
	end

	


end
