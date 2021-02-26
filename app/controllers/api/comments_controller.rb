class Api::CommentsController < ApplicationController
  before_action :authenticate_user
  
  def create
    @comment = Comment.new(
      user_id: current_user.id,
      text: params[:text],
      similarity: params[:similarity],
      enjoyability: params[:enjoyability],
      media_id: params[:media_id],
      suggested_media_id: params[:suggested_media_id]
    )
    if @comment.save
      render "show.json.jb"      
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.user_id == current_user.id
      @comment.similarity = params[:similarity] || @comment.similarity
      @comment.enjoyability = params[:enjoyability] || @comment.enjoyability
      @comment.text = params[:text] || @comment.text
      if @comment.save
        render "show.json.jb"
      else
        render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

end
