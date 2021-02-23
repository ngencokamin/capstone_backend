class Api::MediaController < ApplicationController

  def index
    @shows = Media.all
    render "index.json.jb"
  end

  def show
    @show = Media.find_by(id: params[:id])
    render "show.json.jb"
  end

end
