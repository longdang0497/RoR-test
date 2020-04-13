class Users::FavoritesController < UsersApplicationController
  def index
    favorite_buildings = current_user.favorites.pluck(:building_id)
    @favorite_buildings = Building.all.where(id: favorite_buildings)
  end

  def bookmark
    favorite = Favorite.find_or_initialize_by(building_id: params[:id], user_id: current_user.id)
    if favorite.persisted? 
      favorite.destroy
    else
      favorite.save
    end
  end
end
