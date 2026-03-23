class StarshipsController < ApplicationController
  def index
    @starships = Starship.order(:name)
    @starships = @starships.where("name LIKE ?", "%#{params[:q]}%") if params[:q].present?
    @starships = @starships.page(params[:page]).per(20)
  end

  def show
    @starship = Starship.includes(:films).find(params[:id])
  end
end