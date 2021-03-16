class Api::SavedShowsController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    @saved_shows = SavedShow.where(user_id: params[:id])
    render "index.json.jb"
  end

  def create
    @saved_show = SavedShow.new(user_id: current_user.id, media_id: params[:media_id])
    if @saved_show.save
      render "show.json.jb"
    else
      render json: { errors: @media.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    saved_show = SavedShow.find_by(id: params[:id])
    if saved_show.user_id == current_user.id
      if saved_show.destroy
        render json: { message: "Show successfully removed from watchlist" }
      else
        render json: { errors: @media.errors.full_messages }, status: :unprocessable_entity    
      end
    else
      render json: {}, status: :unauthorized
    end
  end

end
