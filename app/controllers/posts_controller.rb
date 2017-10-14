class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :set_category, only: [:index, :new, :create]

  def index
    if @category
      @posts = @category.posts
    else
      @posts = Post.all
    end

    render json: @posts
  end

  def show
    render json: @post
  end

  def update
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def create
    @post = @category.posts.build(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocesable_entity
    end
  end

  def destroy
    @post.destroy
    render json: :no_content
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def set_category
      @category = Category.find_by(slug: params[:category_id])
    end

    def post_params
      params.require(:post).permit(:name, :content, :slug, :category_id)
    end
end
