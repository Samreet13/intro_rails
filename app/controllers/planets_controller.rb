class PlanetsController < ApplicationController
  def index
    @planets = Planet.order(:name)
    @planets = @planets.where("name LIKE ?", "%#{params[:q]}%") if params[:q].present?
    @planets = @planets.page(params[:page]).per(20)
  end

  def show
    @planet = Planet.includes(:people).find(params[:id])
  end
end