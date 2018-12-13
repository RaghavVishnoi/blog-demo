class ArticlesController  < ApplicationController

	def index
		@articles = Article.all.paginate(:page => params[:page], :per_page => BLOG_PER_PAGE)
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params.merge(author_id: current_user.id))
		if @article.save
			redirect_to articles_path
		else
			flash[:error] = @article.errors.full_messages
			redirect_to new_articles_path
		end	
	end


	private
		def article_params
			params.require(:article).permit(:content, :author_id)
		end

end