class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params_permitted)
		redirect_to(@post)
	end

	private
	def comment_params_permitted
		params.require(:comment).permit(:nick, :content, :datetime)
	end
end
