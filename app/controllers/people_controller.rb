class PeopleController < ApplicationController
  def index
    @people = Person.includes(:planet, :species)
    @people = @people.where("name LIKE ?", "%#{params[:q]}%") if params[:q].present?
    @people = @people.where(species_id: params[:species_id]) if params[:species_id].present?
    @people = @people.order(:name).page(params[:page]).per(20)
    @species_list = Species.order(:name)
  end

  def show
    @person = Person.includes(:planet, :species, :films, :starships).find(params[:id])
  end
end