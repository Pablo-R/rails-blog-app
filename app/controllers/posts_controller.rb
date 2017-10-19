class PostsController < ApplicationController
  authorize_resource except: [:index, :show]
  load_resource param_method: :post_params_permitted, except: :index

  def index
    @posts = Post.all
  end

  def new
    render('new_post_form')
  end

  def create
    @post = current_user.posts.new(post_params_permitted)
    @post.save ? redirect_to(@post) : render('new_post_form')
  end

  def show
    @comment = Comment.new
  end

  def edit
    render('edit_post_form')
  end

  def update
    @post.update(post_params_permitted) ? redirect_to(@post) : render('edit_post_form')
  end

  def destroy
    @post.destroy
    redirect_to(posts_url)
  end

  private
  def post_params_permitted
    params.require(:post).permit(:title, :content, :datetime)
  end
end
