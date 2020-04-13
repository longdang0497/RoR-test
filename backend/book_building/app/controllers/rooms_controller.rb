class RoomsController < ApplicationController
  layout 'show_component', only: [:show]
  before_action :find_room, only: [:show]
  
  def index
  end 

  def show 
    
  end

  private

  def find_room
    @room = Room.find(params[:id])
  end 
end 