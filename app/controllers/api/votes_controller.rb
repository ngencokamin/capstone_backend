class Api::VotesController < ApplicationController
  before_action :authenticate_user

  def create
    @vote = Vote.new(
      user_id: current_user.id,
      comment_id: params[:comment_id],
      value: params[:value]
    )
    if @vote.save
      render "show.json.jb"
    else
      render json: { errors: @vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @vote = Vote.find_by(id: params[:id])
    if @vote.user_id == current_user.id
      @vote.value = params[:value] || @vote.value
      if @vote.save
        render "show.json.jb"
      else
        render json: { errors: @vote.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

end
