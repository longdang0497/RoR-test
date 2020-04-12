class Users::ProfileController < UsersApplicationController
  def index
  end

  def edit; end 

  def update
    if User.update(user_params)
      redirect_to user_profile_path
    end 
  end

  private 

  def user_params
    params.require(:user).permit(:name, :phone, :gender, :identity)
  end 
end
