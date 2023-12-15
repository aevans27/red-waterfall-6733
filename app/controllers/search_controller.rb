class SearchController < ApplicationController
  def index
    if params[:nation].present?
      facade = NationFacade.new
      @results = facade.get_nation_members(params[:nation])
    else
      facade = NationFacade.new
      @results = facade.get_all_nation_members
    end
  end
end