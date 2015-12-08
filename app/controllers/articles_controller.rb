class ArticlesController < ApplicationController

	before_action :find_article, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user! 


	before_action :create_item,     only: :edit
	#before_filter :check_if_admin, only: [:destroy]
	#, exept: [:index, :show]

	def create_item
		@user = current_user.id
		@item = ArticleItem.new
		@item =  Article.find(params[:id])		
		ArticleItem.create(user_id: @user, category_id: @item.category_id, article_id: @item.id, title: @item.title, content: @item.content, titleEn: @item.titleEn, contentEn: @item.contentEn, contentFr: @item.contentFr, contentCn: @item.contentCn, contentEs: @item.contentEs, contentUa: @item.contentUa  )
		
	end


	def index
		if params[:category].blank?
			@articles = Article.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@articles = Article.where(category_id: @category_id).order("created_at DESC")
		end
	end





	def show
		@article =  Article.find(params[:id])	
		@articles_id = @article.id
		@items = ArticleItem.where(article_id: @articles_id ).order("created_at DESC")
	end


	def new
		@article = current_user.articles.build
	end


	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to root_path
	end

	private

	def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

	def find_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:category_id, :title, :titleEn, :titleFr, :titleCn, :titleEs, :titleUa,  :content, :contentEn, :contentFr, :contentCn, :contentEs,  :contentUa,)
		
	end


end
