module SearchBuildingConcern
  include ActiveSupport::Concern

  def search_building(params)
    @search = Building.all.order(updated_at: :DESC).ransack(params)
  end 

end