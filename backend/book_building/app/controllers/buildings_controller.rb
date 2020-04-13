class BuildingsController < ApplicationController
  layout 'show_component', only: [:show]
  before_action :find_building, only: [:show]
  
  include SearchBuildingConcern

  def index
    @search = search_building(params[:q])
    @buildings = @search.result(distinct: true).order(created_at: :DESC).page(params[:page])
  end 

  def show 
    floors = Floor.where(building_id: @building)
    @rooms = Room.where(floor_id: floors)
    @related_buildings = Building.similar(@building)
  end

  private

  def find_building
    @building = Building.find(params[:id])
  end 
end 