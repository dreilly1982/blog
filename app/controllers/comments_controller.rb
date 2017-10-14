class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :load_commentable, only: [:index, :create]

  def index
    @comments = @commentable.comments.descending

    render json: @comments
  end

  def create
    @comment = @commentable.comments.build(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:author, :content, :commentable_id, :commentable_type)
    end

    def load_commentable
      id, resource = request.path.split('/').reverse[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end
end
