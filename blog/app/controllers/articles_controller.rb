class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
	end

	def create
		# render plain: params[:article].inspect #key is plain: with value params[:article].inspect
		# @article = Article.new(params.require(:article).permit(:title, :text)) we're creating an action since the code
		#will be used throughout the controller
		@article = Article.new(article_params)

		@article.save
		redirect_to @article #where is the redirect @article to?
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
