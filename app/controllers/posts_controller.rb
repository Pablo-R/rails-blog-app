class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

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

	def edit
		@post = Post.find(params[:id])
		render('edit_post_form')
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params_permitted) ? redirect_to(@post) : render('edit_post_form')
	end

	def post_params_permitted
		params.require(:post).permit(:title, :content, :datetime)
	end
end
