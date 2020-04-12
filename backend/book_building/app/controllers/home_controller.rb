class HomeController < ApplicationController
  def index
    @search = Building.all.order(updated_at: :DESC).ransack(params[:q])    
    @buildings = @search.result(distinct: true).order(created_at: :DESC).page(params[:page])
  end 
end