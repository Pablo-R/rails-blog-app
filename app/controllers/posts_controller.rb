class PostsController < ApplicationController

	def new
		@post = Post.new
		render('new_post_form')
	end

	def create
		@post = Post.new(post_params_permitted)
		@post.save ? redirect_to(@post) : render('new_post_form')
	end

	def show
		@post = Post.find(params[:id])
	end

	def post_params_permitted
		params.require(:post).permit(:title, :content, :datetime)
	end
end
