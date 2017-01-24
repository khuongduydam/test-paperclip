class PostsController < ApplicationController
  before_action :find_post, except: [:index, :create, :new]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:alert] =  "Create post success"
      redirect_to @post
    else
      flash[:alert] =  "Can not create post"
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def destroy
    if @post.destroy
      flash[:alert] =  "Delete post success"
      redirect_to root_url
    else
      flash[:alert] =  "Can not delete this posts"
    end
  end

  def update
    if @post.update_attributes(:post_params)
      flash[:alert] =  "Update post success"
      redirect_to @post
    else
      flash[:alert] =  "Can not update post"
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def find_post
    @post = Post.find_by_id(params[:id])
  end

end
