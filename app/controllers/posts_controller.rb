class PostsController < ApplicationController
	load_resource
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		authorize! :new, @post, :message => "You are not authorized!"
		render('new_post_form')
	end

	def create
		@post = current_user.posts.new(post_params_permitted)
		@post.save ? redirect_to(@post) : render('new_post_form')
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	def edit
		@post = Post.find(params[:id])
		render('edit_post_form')
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params_permitted) ? redirect_to(@post) : render('edit_post_form')
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to(posts_url)
	end

	private
	def post_params_permitted
		params.require(:post).permit(:title, :content, :datetime)
	end
end
