class ArticlesController < ApplicationController
	# does the :before index indicate action where as infront it'd be a hash?
	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show] 


	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		# render plain: params[:article].inspect #key is plain: with value params[:article].inspect
		# @article = Article.new(params.require(:article).permit(:title, :text)) we're creating an action since the code
		#will be used throughout the controller
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article #where is the redirect @article to?
		else
			render 'new' #will this look under views > articles > new.html.erb
			#render is used instead of redirect_to since render will is done within the same request
			#whereas redirect_to will tell the browser to issue another request.
		end
	end

	def update
		@article = Article.find(params[:id]) #This action needs explaining

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
