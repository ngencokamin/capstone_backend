class Api::MediaController < ApplicationController

  def index
    @media = Media.all.sort_by { |media| -media.comments.length}
    render "index.json.jb"
  end

  def omdb_index
    search = params[:search].tr(" ", "+")
    @search_index = HTTP.get("http://www.omdbapi.com/?s=#{search}&type=series&apikey=#{Rails.application.credentials.omdb[:api_key]}").parse
    render "omdb_index.json.jb"
  end

  def show
    @media = Media.find_by(id: params[:id])
    if !current_user || current_user.profanity_filter 
      if ProfanityFilter::Base.profane?(@media.title)
        @media.title = ProfanityFilter::Base.clean(@media.title, 'hollow')
        @media.poster = nil
      end
    end
    render "show.json.jb"
  end

  def create
    omdb_id = params[:omdb_id]
    @media = Media.find_by('omdb_id = ?', params[:omdb_id]) 
    if !@media
      media_get = HTTP.get("http://www.omdbapi.com/?i=#{omdb_id}&apikey=#{Rails.application.credentials.omdb[:api_key]}").parse
      @media = Media.new(
        omdb_id: omdb_id,
        title: media_get["Title"],
        imdb_rating: media_get["imdbRating"],
        released: media_get["Released"],
        rated: media_get["Rated"],
        plot: media_get["Plot"],
        poster: media_get["Poster"]
      )
    end
    if @media.save
      render "show.json.jb"
    else
      render json: { errors: @media.errors.full_messages }, status: :unprocessable_entity
    end
  end

end
