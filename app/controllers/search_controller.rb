class SearchController < ApplicationController
  def index
    facade = NationFacade.new
    @results = facade.get_nation_members(params[:nation])
  end
end