class CommentsController < ApplicationController
	authorize_resource only: :destroy
	before_action :find_post

	def create
		@comment = @post.comments.create(comment_params_permitted)
		redirect_to(@post)
	end

	def destroy
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to(@post)
	end

	private
	def find_post
		@post = Post.find(params[:post_id])
	end

	private
	def comment_params_permitted
		params.require(:comment).permit(:nick, :content, :datetime)
	end
end
