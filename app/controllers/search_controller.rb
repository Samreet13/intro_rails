class SearchController < ApplicationController
  def index
    @query = params[:q]
    @category = params[:category]

    if @query.present?
      case @category
      when "films"
        @results = Film.where("title LIKE ?", "%#{@query}%")
        @result_type = "films"
      when "planets"
        @results = Planet.where("name LIKE ?", "%#{@query}%")
        @result_type = "planets"
      when "starships"
        @results = Starship.where("name LIKE ? OR model LIKE ?", "%#{@query}%", "%#{@query}%")
        @result_type = "starships"
      when "species"
        @results = Species.where("name LIKE ?", "%#{@query}%")
        @result_type = "species"
      else
        @results = Person.where("name LIKE ?", "%#{@query}%")
        @result_type = "people"
      end
    end
  end
end