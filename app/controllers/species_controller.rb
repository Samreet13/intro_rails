class SpeciesController < ApplicationController
  def index
    @species = Species.order(:name).page(params[:page]).per(20)
  end

  def show
    @species = Species.includes(:people).find(params[:id])
  end
end