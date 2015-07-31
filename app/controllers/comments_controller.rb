class CommentsController < ApplicationController

	# Works with the super simple ajax requests
	# TODO: figure out how to do this properly
	skip_before_action :verify_authenticity_token

	def index
		#@comments = Comment.all
		comments = Comment.all
		ActiveRecord::Base.include_root_in_json = false
  		render plain: comments.to_json
	end

	def create

		comment = Comment.new

		# Works with the super simple ajax requests
		# TODO: figure out how to do this properly
		comment.author = params[:author]
		comment.text = params[:text]
		
		if comment.save
			ActiveRecord::Base.include_root_in_json = false
			render plain: comment.to_json
		else
			head 500
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to comments_path
	end

	private
		def comment_params
			params.require(:comment).permit(:author, :text)
		end
end
