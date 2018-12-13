class FeedbacksController < ApplicationController

	def index
		@feedbacks = Feedback.where(article_id: params[:id])
	end

	def new
		@feedback = Feedback.new
	end

	def create
		@feedback = Feedback.new(feedback_params.merge(user_id: current_user.id))
		if @feedback.save
			redirect_to articles_path
		else
			flash[:error] = @feedback.errors.full_messages
		end	
	end

	private
		def feedback_params
			params.require(:feedback).permit(:content, :article_id, :feedback_type)
		end

end