class HomeController < ApplicationController
  include SearchBuildingConcern

  def index
    @search = search_building(params[:q])
    @buildings = @search.result(distinct: true).order(created_at: :DESC).page(params[:page])
  end 
end