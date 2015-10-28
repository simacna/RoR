class CommentsController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	def create
		# each request for a comment has to keep track of the article to which the comment is attached, 
		# thus the initial call to the find method of the Article model to get the article in question
		@article = Article.find(params[:article_id]) 
		@comment = @article.comments.create(comment_params) #create method creates and saves the comment, automatically linking the comment to the particular id
		redirect_to article_path(@article) #This calls the show action of the ArticlesController which in turn renders the show.html.erb 
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body) 
			# what is :comment -- is it the singular form of the :comments table?. assuming :commenter and :body come from the columns created in table
			# with :commenter and :body
		end
end

# create comment and route to show