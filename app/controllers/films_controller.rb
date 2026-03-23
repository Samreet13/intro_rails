class FilmsController < ApplicationController
  def index
    @films = Film.order(:episode_id)
  end

  def show
    @film = Film.includes(:people, :starships).find(params[:id])
  end
end