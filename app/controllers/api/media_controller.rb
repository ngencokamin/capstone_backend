class Api::MediaController < ApplicationController

  def index
    @shows = Media.all
    render "index.json.jb"
  end

  def show
    @show = Media.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    omdb_id = params[:omdb_id]
    media_get = HTTP.get("http://www.omdbapi.com/?i=#{omdb_id}&apikey=#{Rails.application.credentials.omdb[:api_key]}").parse
    @show = Media.new(
      omdb_id: omdb_id,
      title: media_get["Title"],
      imdb_rating: media_get["imdbRating"],
      released: media_get["Released"],
      rated: media_get["Rated"],
      plot: media_get["Plot"],
      poster: media_get["Poster"]
    )
    if @show.save
      render "show.json.jb"
    else
      render json: { errors: @show.errors.full_messages }, status: :unprocessable_entity
    end
  end

end
